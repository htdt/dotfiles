ctrp() {
    local name="${1:?Usage: ctrp <name>}"
    shift
    claude \
        --name "$name" \
        --remote-control \
        --channels plugin:telegram@claude-plugins-official \
        --settings '{"enabledPlugins":{"telegram@claude-plugins-official":true}}' \
        --permission-mode bypassPermissions \
        "$@"
}

crp() {
    local name="${1:?Usage: crp <name>}"
    shift
    claude \
        --name "$name" \
        --remote-control \
        --permission-mode bypassPermissions \
        "$@"
}

cr() {
    local name="${1:?Usage: cr <name>}"
    shift
    claude \
        --name "$name" \
        --remote-control \
        "$@"
}

ct() {
    claude \
        --channels plugin:telegram@claude-plugins-official \
        --settings '{"enabledPlugins":{"telegram@claude-plugins-official":true}}' \
        "$@"
}

ctp() {
    claude \
        --channels plugin:telegram@claude-plugins-official \
        --settings '{"enabledPlugins":{"telegram@claude-plugins-official":true}}' \
        --permission-mode bypassPermissions \
        "$@"
}

alias cserver='claude remote-control'

alias cclear='rm -rf ~/.claude/projects/*'

clist() {
    echo "ctrp <name>  - remote-control + telegram + bypassPermissions"
    echo "crp <name>   - remote-control + bypassPermissions"
    echo "cr <name>    - remote-control"
    echo "ct           - telegram"
    echo "ctp          - telegram + bypassPermissions"
    echo "cserver      - claude remote-control server"
    echo "cclear       - wipe claude project memory"
}
