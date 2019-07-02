warn() {
    if [[ $1 = -n ]]; then
        shift;
        echo -ne "$@" >&2;
    else
        echo -e "$@" >&2;
    fi
}

error() {
    if [[ $1 = -n ]]; then
        shift;
        warn -n "[31m$@[0m";
    else
        warn "[31m$@[0m";
    fi
}

success() {
    if [[ $1 = -n ]]; then
        shift;
        warn -n "[32m$@[0m";
    else
        warn "[32m$@[0m";
    fi
}

warning() {
    if [[ $1 = -n ]]; then
        shift;
        warn -n "[33m$@[0m";
    else
        warn "[33m$@[0m";
    fi
}

info() {
    if [[ $1 = -n ]]; then
        shift;
        warn -n "[34m$@[0m";
    else
        warn "[34m$@[0m";
    fi
}

# # parse args example
# i=1;
# long_arg=;
# files=;
# 
# while [[ $i -le $# ]]; do
#     arg=${!i};
# 
#     case $arg in
#         -h|--help)
#             help;
#             exit;
#             ;;
#         -l|--long-arg*)
#             if [[ $arg = *=* ]]; then
#                 long_arg=$(awk -F= '{print$2}' <<< $arg);
#             else
#                 i=$((i+1));
#                 long_arg=${!i};
#             fi
#             ;;
#         -*)
#             warning "Unknown option '$arg', ignoring.";
#             ;;
#         *)
#             if [[ -n $files ]]; then
#                 files="$files ${!i}";
#             else
#                 files="${!i}";
#             fi
#             ;;
#     esac
# 
#     i=$((i+1));
# done
# 
# if [[ -z $files ]]; then
#     error "No files specified, aborting.";
# fi
