
function replacekey
    find ./Localization -type f -name "*.strings" -exec perl -i -pe's/(?<=^")$argv[1](?=s)/$argv[2]/g' {} +
end
