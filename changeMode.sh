if [[ \"$1\" = \"strict\" ]]; then
    cat podspec-strict-template.txt > npmtestforbm.podspec
    echo "AppsFlyer SDK Strict mode ✅ "
else
  cat podspec-regular-template.txt > npmtestforbm.podspec
  echo "AppsFlyer SDK Regular mode ✅ "
fi
