#!/bin/bash
ALL_DIFFS="\n"

for i in {0..15}
do
    echo "Processing solution number $i"
    
    # Compile the Parser
    javac -cp . TJ1asn/Parser.java

    # Generate the actual solution
    java -cp "TJ1solclasses;." TJ1asn.TJ CS316ex$i.java ./actual-sol/$i.sol

    # Generate your solution
    java -cp . TJ1asn.TJ CS316ex$i.java ./my-sol/$i.out

    # Compare outputs
    DIFF=$(diff ./my-sol/$i.out ./actual-sol/$i.sol)
    if [ "$DIFF" != "" ] 
    then
        echo "Difference found in solution $i:"
        echo "$DIFF"
        ALL_DIFFS+="Difference found in solution $i:\n$DIFF\n\n"
    else
        echo "No difference found in solution $i."
        ALL_DIFFS+="No difference found in solution $i.\n\n"
    fi
done

# Print all differences at once
echo -e "$ALL_DIFFS"