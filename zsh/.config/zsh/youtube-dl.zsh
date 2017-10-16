# Download French and German videos from arte.tv
#
# $@: arte.tv URL(s) (either French or German)
arte-dl() {
  # Replace /fr/ or /de/ by {fr,de} in the arte.tv URL(s) (arte.tv handles correctly the switch of locale, even when done directly in their URLs)
  # Pass the URL to xargs which expands {fr,de} (thanks to `sh -c`),
  # then pass the output to youtube-dl (`-I %` positions the output after `youtube-dl`)
  echo "$@" | sed -r "s@(/fr/|/de/)@/{fr,de}/@g" | xargs -I % sh -c "youtube-dl %"
}
