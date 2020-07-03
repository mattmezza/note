function note() {
    NOTE_DIR="$HOME"
    if [ -d "${NOTE_SCRATCH_DIR}" ]; then
        NOTE_DIR="${NOTE_SCRATCH_DIR}"
    fi

    case "$1" in
        list|l)
            ls -1 $NOTE_DIR/*.txt
            ;;
        new|n)
            FILE_NAME="$(date +%Y%m%d%H%M)-$(echo $2 | sed 's/ /_/g')"
            $VISUAL "$NOTE_DIR/$FILE_NAME.txt"
            ;;
        open|o)
            case "$2" in
                last)
                    $VISUAL $(note last)
                    ;;
                *)
                    $VISUAL "$NOTE_DIR/$2"
                    ;;
            esac
            ;;
        path|p)
            echo "$NOTE_DIR/$2"
            ;;
        rm)
            case "$2" in
                last)
                    rm -i $(note last)
                    ;;
                *)
                    rm -i "$NOTE_DIR/$2"
                    ;;
            esac
            ;;
        last)
            echo $(note list | tail -n 1)
            ;;
        help)
            echo "Usage:"
            echo "  $ $0 list|l"
            echo "  $ $0 new|n name"
            echo "  $ $0 open|o name"
            echo "  $ $0 path|p"
            echo "  $ $0 path|p name"
            echo "  $ $0 rm name"
            echo "  $ $0 last"
            echo "Your scratch notes dir is: '$NOTE_DIR'"
            ;;
        *)
            echo "Missing command.\n$ $0 help"
            return 1
            ;;
    esac
}
