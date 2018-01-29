REPONAMES=(
    "discover"
    "unificommon"
    "clientsharedui"
    "licensingcommon"
    "licensingdata"
    "licensing"
    "sqlrepositorydata"
    "unificontentrepository"
    "revitaddins"
    "revitcommon"
    "resharperconfig"
    "licensingmonthlyrenewal"
)
DIR="$PWD"
echo "Cloning repos to: $DIR"
for R in ${!REPONAMES[*]}
do
    REPO=${REPONAMES[R]}
    if [ -d "${DIR}/${REPO}" ]
    then
        echo
        echo "+ ${REPO} already exists."
    else
        echo
        echo "# Cloning ${REPO}"
        git clone "git@github.com:unifilabs/${REPO}.git"
    fi
done
echo
echo "Finished."

