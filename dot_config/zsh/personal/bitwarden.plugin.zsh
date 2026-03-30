# Get password from macOS keychain
_bw_get_password() {
  security find-internet-password -l "vault.bitwarden.com" -w 2>/dev/null
}

# Get session from keychain
_bw_get_session_from_keychain() {
  security find-generic-password -l "bitwarden_session" -w 2>/dev/null
}

# Store session in keychain
_bw_store_session_in_keychain() {
  local session="$1"
  if [[ -z "$session" ]]; then
    return 1
  fi
  # Create or update the keychain item
  security add-generic-password -U -l "bitwarden_session" -w "$session" 2>/dev/null
}

# Remove session from keychain (set empty value)
_bw_remove_session_from_keychain() {
  security add-generic-password -U -l "bitwarden_session" -w "" 2>/dev/null
}

# Check if session is valid
_bw_session_is_valid() {
  if [[ -z "$BW_SESSION" ]]; then
    return 1
  fi
  bw unlock --check >/dev/null 2>&1
}

# Unlock Bitwarden vault
bw_unlock() {
  # Check if already unlocked
  if _bw_session_is_valid; then
    echo "Bitwarden already unlocked"
    return 0
  fi

  # Try to restore session from keychain
  local session=$(_bw_get_session_from_keychain)
  if [[ -n "$session" ]]; then
    export BW_SESSION="$session"
    if _bw_session_is_valid; then
      echo "Bitwarden unlocked from keychain"
      return 0
    fi
  fi

  # Get password from keychain and unlock
  local password=$(_bw_get_password)
  if [[ -z "$password" ]]; then
    echo "Error: Bitwarden password not found in keychain (vault.bitwarden.com)"
    return 1
  fi

  # Unlock vault using password
  session=$(BW_PASSWORD="$password" bw unlock --passwordenv BW_PASSWORD --raw 2>/dev/null)
  if [[ -z "$session" ]]; then
    echo "Error: Failed to unlock Bitwarden vault"
    return 1
  fi

  # Store session and export
  export BW_SESSION="$session"
  _bw_store_session_in_keychain "$session"
  echo "Bitwarden unlocked"
  return 0
}

# Lock Bitwarden vault
bw_lock() {
  unset BW_SESSION
  _bw_remove_session_from_keychain
  echo "Bitwarden locked"
}
