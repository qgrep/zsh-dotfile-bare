navialias()
{ 
   navi --query ":: $1" --best-match
}

# @description returns best match using navi
# @arg $1 string search string
navibestmatch()
{ 
   navi --query "$1" --best-match
}
