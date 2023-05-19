#!/bin/bash

# Loop through all subdirectories
for subdir in */; do
    # Check if test.sh exists in the subdirectory
    if [ -e "${subdir}/test.sh" ]; then
        # Check if the "ERROR" string is present in the test.sh file
        if grep -q "ERROR" "${subdir}/test.sh"; then
            # If "ERROR" is found, set the result to -1
            line_count=-1
        else
            # If "ERROR" is not found, count the number of non-empty lines, excluding the #!/bin/bash line
            line_count=$(grep -v -e '^$' -e '^#' -e 'sleep' "${subdir}/test.sh" | wc -l)
        fi

        # Print the result along with the subdirectory name
        echo "${subdir}: ${line_count} lines"
    else
        # If test.sh does not exist in the subdirectory, print a message
        echo "${subdir}: test.sh not found"
    fi
done
