#!/bin/bash

# ^ Tell the system to run this using bash.
# The location of bash -- the program itself -- can be found with 'which bash'.
# /bin/bash is a common location for it.

if [[ $1 = "help" ]]
then
  echo "Create and Examine Data

usage: final_script.sh [help | version | lookup ]

examples:
      final_script.sh -h / final_script.sh help
      final_script.sh -v / final_script.sh version

      final_script.sh lookup
"
  exit
fi

if [[ $1 = "version" ]]
then
  echo version 1.0.0
  exit
fi

if [[ $1 = "lookup" ]] 
then
  this_is_the_final_round=""

  while [ -z "$this_is_the_final_round" ]
  do
    echo What text would you like to look up?
    read text_to_look_up

    number_of_matches=$(grep -i "$text_to_look_up" "$(dirname $0)/romeo_and_juliet.txt" | wc -l)
    echo There are $number_of_matches matching lines for $text_to_look_up.

    echo Would you like to look up another phrase? [Y/N]
    read look_up_another_phrase

    if [[ ! $look_up_another_phrase = "Y" ]] && [[ ! $look_up_another_phrase = "y" ]]
    then
      this_is_the_final_round=1
      echo "Ok, goodbye!"
    fi
  done
fi
