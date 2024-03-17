

ccwc()
{
    # Create a temporary file
    temp_file=$(mktemp)

    if [ -p /dev/stdin ]
    then
        # Append file Contetnt from stdin if passed through pipe
        cat >> "$temp_file"
    elif [ "$#" -eq 0 ]
    then
        echo "Usage: ccwc [-c] [-l] [-m] [-w] <fileName>"
        return
    fi  

    local is_count_bytes=false
    local is_count_length=false
    local is_count_chars=false
    local is_count_words=false
    local fileName=""

    while [ "$#" -gt 0 ]
    do
        case "$1" in
            -c)
                is_count_bytes=true
                shift
                ;;
            -l)
                is_count_length=true
                shift
                ;;
            -m)
                is_count_chars=true
                shift
                ;;
            -w)
                is_count_words=true
                shift
                ;;
            *)
                fileName=$1
                # Append file content to temporary file
                cat "$fileName" >> "$temp_file"
                shift
                ;;
        esac
    done

    if [ -s "$temp_file" ]
    then
        # echo "File input from temp File"
    elif [ ! -f "$fileName" ]
    then
        echo "File does not exist"
        return
    fi

    if [ "$is_count_bytes" = true ]
    then
        local byte_count=0
        byte_count=$(ls -l "$temp_file" | awk '{print $5}')
        echo "   ${byte_count} ${fileName}"
    elif [ "$is_count_length" = true ]
    then
        local line_count=0
        while IFS= read -r line
        do
            ((line_count++))
        done < "$temp_file"
        echo "   ${line_count} ${fileName}"
    elif [ "$is_count_chars" = true ]
    then
        local char_count=0
        while IFS= read -r line
        do
            ((char_count+=${#line}+1))
        done < "$temp_file"
        echo "   ${char_count} ${fileName}"
    elif [ "$is_count_words" = true ]
    then
        word_count=$(grep -o '\S\+' "$temp_file" | ccwc -l)
        echo "   ${word_count} ${fileName}"
    else
        lines=$(ccwc -l "$temp_file" | read var1 var2 && echo "$var1" | awk "{print $1}")
        words=$(ccwc -w "$temp_file" | read var1 var2 && echo "$var1" | awk "{print $1}")
        bytes=$(ccwc -c "$temp_file" | read var1 var2 && echo "$var1" | awk "{print $1}")
        echo -e "    $lines   $words  $bytes $fileName"
    fi

    # Remove the temporary file
    rm -f "$temp_file"
}