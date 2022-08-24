#!/bin/bash
we=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs)

printf "    $we "
