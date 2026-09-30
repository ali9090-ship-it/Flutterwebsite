# Flutter Web Portfolio

## Setup (first time)
This folder has the source files only. Generate the platform scaffolding:

    flutter create . --platforms web --project-name mohd_portfolio
    flutter pub get

`flutter create .` keeps the files already here (lib/main.dart, pubspec.yaml, web/index.html).
If it overwrote web/index.html, copy the title/meta tags back from this README's project.

## Edit your content
Open `lib/main.dart` and change the block at the top (name, about, skills, projects, links).

## Run
    flutter run -d chrome

## Build
    flutter build web --release

## Deploy to Vercel
    cd build/web
    cp ../../vercel.json .
    npx vercel --prod

## Deploy to GitHub Pages
    flutter build web --release --base-href "/YOUR-REPO-NAME/"
    # publish build/web to the gh-pages branch
