MESSAGE="chore: Bump toc for latest patch"

read -p "Confirm bumping version [y/n]: " -n 1 -r
echo ""   # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -L \
         -X POST \
         -H "Accept: application/vnd.github+json" \
         -H "Authorization: Bearer $1" \
         -H "X-GitHub-Api-Version: 2022-11-28" \
         https://api.github.com/repos/$2/$3/actions/workflows/tocBump.yml/dispatches \
        -d "{\"ref\":\"master\",\"inputs\":{\"message\":\"${MESSAGE}\"}}"
fi

exit 1
