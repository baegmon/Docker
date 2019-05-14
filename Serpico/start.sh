#!/bin/sh

if [ ! -f ./db/master.db ]; then
    echo "First run detected. Initializing database..."
    printf "%s\n" "$INITIAL_USERNAME" "Y" | 
    ruby ./scripts/first_time.rb
fi

ruby serpico.rb