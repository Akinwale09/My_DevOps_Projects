#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# - Creates IAM users from an array
# - Creates an "admin" group if missing
# - Attaches AWS-managed AdministratorAccess policy to admin group
# - Adds each user to the admin group

# -----------------------------
# Configuration: edit as needed
# -----------------------------
IAM_USER_NAMES=("devops_user1" "devops_user2" "devops_user3" "devops_user4" "devops_user5")
ADMIN_GROUP_NAME="admin"
ADMIN_POLICY_ARN="arn:aws:iam::aws:policy/AdministratorAccess"

# -----------------------------
# Utility functions
# -----------------------------
log() { echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] $*"; }

# -----------------------------
# Create IAM users
# -----------------------------
create_iam_users() {
    log "Starting IAM user creation process..."
    echo "-------------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        log "Processing user: $user"

        if aws iam get-user --user-name "$user" >/dev/null 2>&1; then
            log "User '$user' already exists — skipping creation."
        else
            if aws iam create-user --user-name "$user" >/dev/null 2>&1; then
                log "Created IAM user: $user"
            else
                echo "Error: Failed to create user $user" >&2
            fi
        fi
    done

    echo "------------------------------------"
    log "IAM user creation process completed."
    echo ""
}

# -----------------------------
# Create admin group and attach policy
# -----------------------------
create_admin_group() {
    log "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    if aws iam get-group --group-name "$ADMIN_GROUP_NAME" >/dev/null 2>&1; then
        log "Group '$ADMIN_GROUP_NAME' already exists."
    else
        if aws iam create-group --group-name "$ADMIN_GROUP_NAME" >/dev/null 2>&1; then
            log "Created group: $ADMIN_GROUP_NAME"
        else
            echo "Error: Failed to create group $ADMIN_GROUP_NAME" >&2
        fi
    fi

    # Attach AdministratorAccess policy if not already attached
    attached_count=$(aws iam list-attached-group-policies --group-name "$ADMIN_GROUP_NAME" --query "length(AttachedPolicies[?PolicyArn=='$ADMIN_POLICY_ARN'])" --output text 2>/dev/null || echo 0)

    if [ "$attached_count" = "0" ] || [ -z "$attached_count" ]; then
        echo "Attaching AdministratorAccess policy..."
        if aws iam attach-group-policy --group-name "$ADMIN_GROUP_NAME" --policy-arn "$ADMIN_POLICY_ARN" >/dev/null 2>&1; then
            log "Success: AdministratorAccess policy attached to $ADMIN_GROUP_NAME"
        else
            echo "Error: Failed to attach AdministratorAccess policy" >&2
        fi
    else
        log "AdministratorAccess policy already attached to $ADMIN_GROUP_NAME"
    fi

    echo "----------------------------------"
    echo ""
}

# -----------------------------
# Add users to admin group
# -----------------------------
add_users_to_admin_group() {
    log "Adding users to admin group..."
    echo "------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        log "Ensuring user '$user' is a member of '$ADMIN_GROUP_NAME'"

        # Ensure user exists
        if ! aws iam get-user --user-name "$user" >/dev/null 2>&1; then
            echo "Warning: user $user does not exist. Skipping add-to-group." >&2
            continue
        fi

        # Check if user already in group
        in_group=$(aws iam list-groups-for-user --user-name "$user" --query "length(Groups[?GroupName=='$ADMIN_GROUP_NAME'])" --output text 2>/dev/null || echo 0)

        if [ "$in_group" = "0" ] || [ -z "$in_group" ]; then
            if aws iam add-user-to-group --user-name "$user" --group-name "$ADMIN_GROUP_NAME" >/dev/null 2>&1; then
                log "Added $user to $ADMIN_GROUP_NAME"
            else
                echo "Error: Failed to add $user to $ADMIN_GROUP_NAME" >&2
            fi
        else
            log "User $user already a member of $ADMIN_GROUP_NAME"
        fi
    done

    echo "----------------------------------------"
    log "User group assignment process completed."
    echo ""
}

# -----------------------------
# Main execution
# -----------------------------
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first." >&2
        exit 1
    fi

    # Quick credentials check
    if ! caller_info=$(aws sts get-caller-identity --output text 2>/dev/null); then
        echo "Error: AWS CLI credentials not configured or invalid. Run 'aws configure' or provide credentials." >&2
        exit 2
    else
        log "AWS credentials appear valid: $caller_info"
    fi

    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
