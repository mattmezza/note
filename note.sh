function note() {
	NOTE_DIR="$HOME"
	if [ -d "${NOTE_SCRATCH_DIR}" ]; then
		NOTE_DIR="${NOTE_SCRATCH_DIR}"
	fi

	case "$1" in
		list|l|li)
			ls -1 $NOTE_DIR/*.txt
			;;
		new|n|create|c)
			FILE_NAME="$(date +%Y%m%d%H%M)-$(echo $2 | sed 's/ /_/g')"
			$VISUAL "$NOTE_DIR/$FILE_NAME.txt"
			;;
		open|o|edit|e)
			case "$2" in
				last)
					$VISUAL $(note last)
					;;
                last-*)
                    idx="${1##*-}"
                    tidx=$((idx+1))
                    $VISUAL $(note last-$tidx)
                    ;;
				*)
					$VISUAL "$NOTE_DIR/$2"
					;;
			esac
			;;
		path|p)
			echo "$NOTE_DIR/$2"
			;;
		rm|delete)
			case "$2" in
				last)
					rm -i $(note last)
					;;
                last-*)
                    idx="${1##*-}"
                    tidx=$((idx+1))
                    rm -i $(note last-$tidx)
                    ;;
				*)
					rm -i "$NOTE_DIR/$2"
					;;
			esac
			;;
		last)
			echo $(note list | tail -n 1)
			;;
        last-*)
            idx="${1##*-}"
            tidx=$((idx+1))
            echo $(note list | tail -n $tidx | head -n 1)
            ;;
		help|h)
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
