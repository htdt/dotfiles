ctg() {
    local name="${1:?Usage: ctg <name>}"
    shift
    claude \
        --name "$name" \
        --remote-control \
        --channels plugin:telegram@claude-plugins-official \
        --settings '{"enabledPlugins":{"telegram@claude-plugins-official":true}}' \
        --permission-mode bypassPermissions \
        "$@"
}

crc() {
    local name="${1:?Usage: crc <name>}"
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

ctgl() {
    claude \
        --channels plugin:telegram@claude-plugins-official \
        --settings '{"enabledPlugins":{"telegram@claude-plugins-official":true}}' \
        "$@"
}

alias cserver='claude remote-control'

alias cclear='rm -rf ~/.claude/projects/*'

clist() {
    echo "ctg <name>   - remote-control + telegram + bypassPermissions"
    echo "crc <name>   - remote-control + bypassPermissions"
    echo "cr <name>    - remote-control"
    echo "ctgl         - telegram plugin only"
    echo "cserver      - claude remote-control server"
    echo "cclear       - wipe claude project memory"
}
