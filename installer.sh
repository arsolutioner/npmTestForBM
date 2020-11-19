echo "📦 Do you want the Strict version of AppsFlyer react-native SDK? (no IDFA collection)[y/n]"
read ANSWER
if [[ \"$ANSWER\" = \"y\" ||  \"$ANSWER\" = \"Y\" ]]; then
    echo "You choose Strict mode ✅"
    cat podspec-strict-template.txt > npmtestforbm.podspec
else
  echo "You choose Regular mode ✅"
fi
