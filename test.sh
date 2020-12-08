function replace-line-in-file () {
    file="$1"
    line_num="$2"
    replacement="$3"

    replacement_escaped=$( echo "$replacement" | sed -e 's/[\/&]/\\&/g' )
    sed -i '' "${line_num}s/.*/$replacement_escaped/" "$file"
}

allData=$(curl -sk https://vtex-toolbelt-test.s3.us-east-2.amazonaws.com/darwin-x64)

version=$(echo $allData | jq --raw-output '.version')
url=$(echo $allData | jq --raw-output '.gz')
sha256=$(echo $allData | jq --raw-output '.sha256gz')

replace-line-in-file "Formula/verascli.rb" 4 "  url \"$url\""
replace-line-in-file "Formula/verascli.rb" 5 "  version \"$version\""
replace-line-in-file "Formula/verascli.rb" 6 "  sha256 \"$sha256\""
