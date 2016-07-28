docker exec -it $(docker ps | grep  moderations-devel | ruby -ne 'puts $_.split.first') bash
