#!/bin/bash
#

PROJECT=ot

function makePage () {
    title=$1
    page=$2
    nav=$3
    html_page=$4
    echo "Generating $html_page"
    mkpage \
        "title=text:$title" \
        "content=$page" \
        "nav=$nav" \
        page.tmpl > $html_page
    git add $html_page
}

# index.html
if [ -f README.md ]; then
    makePage "$PROJECT" README.md nav.md index.html
fi

# install.html
if [ -f INSTALL.md ]; then
    makePage "$PROJECT" INSTALL.md nav.md install.html
fi

# license.html
if [ -f LICENSE ]; then
    makePage "$PROJECT" "markdown:$(cat LICENSE)" nav.md license.html
fi

if [ -f ot-recipes.md ]; then
    makePage "$PROJECT" ot-recipes.md nav.md ot-recipes.html
fi

# Add the files to git as needed
git add index.html install.html license.html ot-recipes.html 

# Add command docs
for FNAME in orcid; do
    makePage "$PROJECT" $FNAME.md nav.md $FNAME.html
done