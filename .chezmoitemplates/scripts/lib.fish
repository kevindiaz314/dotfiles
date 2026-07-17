# Inline these helpers because Chezmoi runs rendered scripts from temporary files.

# Tokyo Night palette. Fish's set_color accepts RGB values without a leading #.
set --global tn_foreground c0caf5
set --global tn_blue 7aa2f7
set --global tn_cyan 7dcfff
set --global tn_green 9ece6a
set --global tn_yellow e0af68
set --global tn_red f7768e
set --global tn_muted 737aa2

# Avoid ANSI escape sequences in redirected logs and honor the NO_COLOR
# convention: https://no-color.org/
set --global tn_color_enabled false
if isatty stdout; and test "$TERM" != dumb; and not set --query NO_COLOR
    set tn_color_enabled true
end

function tn_paint
    if $tn_color_enabled
        set_color $argv
    end
end

function tn_reset
    if $tn_color_enabled
        set_color normal
    end
end

# Keep package-manager output visible between recognizable status messages.
# Quote the tn_paint/tn_reset substitutions: when colors are disabled they
# print nothing, and an unquoted empty command substitution expands to zero
# printf arguments, shifting the message into the wrong %s slot.
function tn_rule
    set --local rule (string repeat --count 68 '━')
    printf '%s%s%s\n' "$(tn_paint $tn_blue)" $rule "$(tn_reset)"
end

function tn_section --argument-names title
    echo
    tn_rule
    printf '%s  %s%s\n' "$(tn_paint --bold $tn_cyan)" $title "$(tn_reset)"
    tn_rule
    echo
end

function tn_info
    printf '%s→%s %s\n' "$(tn_paint $tn_blue)" "$(tn_reset)" (string join ' ' -- $argv)
end

function tn_success
    printf '%s✓%s %s\n' "$(tn_paint $tn_green)" "$(tn_reset)" (string join ' ' -- $argv)
end

function tn_warn
    printf '%s!%s %s\n' "$(tn_paint $tn_yellow)" "$(tn_reset)" (string join ' ' -- $argv)
end

function tn_error
    printf '%s✗%s %s\n' "$(tn_paint $tn_red)" "$(tn_reset)" (string join ' ' -- $argv) >&2
end

function tn_detail
    printf '%s  %s%s\n' "$(tn_paint --bold $tn_muted)" (string join ' ' -- $argv) "$(tn_reset)"
end

# Avoid relying on shell startup files because Homebrew uses two common prefixes.
function tn_find_brew
    if command --query brew
        command --search brew
        return 0
    end

    for candidate in /opt/homebrew/bin/brew /usr/local/bin/brew
        if test -x $candidate
            echo $candidate
            return 0
        end
    end

    return 1
end
