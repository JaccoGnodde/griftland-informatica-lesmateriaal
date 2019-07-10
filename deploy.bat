call npm run docs:build

cd docs/.vuepress/dist
echo lesmateriaal.griftland.info > CNAME
git init
git add -A
git commit -m "deploy"
git push -f https://github.com/jaccognodde/griftland-informatica-lesmateriaal.git master:gh-pages