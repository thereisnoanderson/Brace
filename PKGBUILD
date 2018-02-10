# Maintainer: Tad <tad@spotco.us>
pkgname=brace
pkgver=1.4
pkgrel=19
pkgdesc="Increases privacy/security through various configs. Firefox hardening credit: @pyllyukko"
arch=('any')
license=('custom')
conflicts=('dnu' 'brace-ff')
optdepends=('arch-audit: check for insecure packages'
	'extirpater: erase drive freespace'
	'firejail: sandbox programs'
	'linux-hardened: harden against exploits'
	'rkhunter: scan for rootkits'
	'scfw: seal your ports'
	'firefox: browser'
	'firefox-nightly: browser')
source=('21-disable-connectivity-check.conf'
	'30-mac-randomization.conf'
	'60-restrict.conf'
	'blacklist-dma.conf'
	'blacklist-usbnet.conf'
	'iwlwifi.conf'
	'dnu.service'
	'umask.sh'
	'https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js')
sha512sums=('8ec47524685a59ed1ca45d5ba5334248cc505c07d71f1340d77a20e96e647b32c7a10cac1f1a2e32b0477a53c7ce14c57e839057b2b4fe7191932001c5679364'
            'cd03db723b789e9084cc2474edb3bf3f878cc5a751b437f69dd6f06a8015070e7c3f6750b581c15524e869f9fd8dd7db7eff9dad0650930e04387f5a36b4510e'
            '6cb5351444dc9cb12883a44f3895a211388eccc2f0ad00aad5c29add7e721cab846d9b6d048d4bb1a70cc840a53a56c5e946ac72ef0a9bc673fa7131283c5680'
            'fcee1964b26f4309f20c8917a71d448e26f0f2c340ccea0a67f99d704dd009249d09aa215bd2424e234bc9b7927e4679043c2dad78f3fe8e8d744b07485ae655'
            '7f7d833f4b1437a99e0f30e6dd3b474ac75a52f830864f88b2d1337845daa59e46b4558437568067a7040c7d6bb72bdecc5490fedb71ac8049dccafb334bdda1'
            'c07d4f5d591a07db530deb77065e488e788fd964c081c2859cee07cb0820c69ab8236b8713425c77b47a75435907643cd9a021719f7389c09b20787df1b0860b'
            '2bb7c4306b94687583caf5db2a8c384ffeeedcbaba72acc96a686e91a49c48e7b73a34e2dba74f8532d59ee250560fc6bf819e1308e37d9028d2138297d18b94'
            'e81b8fad493ee9dc66b1b0e728195b483a4da8edbf8d19771d0b86a2b1883283c7a58ebee97c8daf255355103f47b8d97645b1c5dac6947ca01efac0bdd4a6da'
            'SKIP')

build() {
	#Mark preferences properly
	sed -i 's/user_pref(/pref(/' user.js;

	#Disable some aggressive preferences
	sed -i 's/pref("dom.serviceWorkers.enabled"/\/\/BRACE-DISABLED: pref("dom.serviceWorkers.enabled"/' user.js
	sed -i 's/pref("dom.workers.enabled"/\/\/BRACE-DISABLED: pref("dom.workers.enabled"/' user.js
	sed -i 's/pref("dom.allow_cut_copy"/\/\/BRACE-DISABLED: pref("dom.allow_cut_copy"/' user.js
	sed -i 's/pref("keyword.enabled"/\/\/BRACE-DISABLED: pref("keyword.enabled"/' user.js
	sed -i 's/pref("svg.disabled"/\/\/BRACE-DISABLED: pref("svg.disabled"/' user.js
	sed -i 's/pref("browser.display.use_document_fonts"/\/\/BRACE-DISABLED: pref("browser.display.use_document_fonts"/' user.js
	sed -i 's/pref("pdfjs.disabled"/\/\/BRACE-DISABLED: pref("pdfjs.disabled"/' user.js
	sed -i 's/pref("app.update.enabled"/\/\/BRACE-DISABLED: pref("app.update.enabled"/' user.js
	sed -i 's/pref("browser.search.suggest.enabled"/\/\/BRACE-DISABLED: pref("browser.search.suggest.enabled"/' user.js
	sed -i 's/pref("browser.urlbar.suggest.history"/\/\/BRACE-DISABLED: pref("browser.urlbar.suggest.history"/' user.js
	sed -i 's/pref("browser.privatebrowsing.autostart"/\/\/BRACE-DISABLED: pref("browser.privatebrowsing.autostart"/' user.js
	sed -i 's/pref("privacy.sanitize.sanitizeOnShutdown"/\/\/BRACE-DISABLED: pref("privacy.sanitize.sanitizeOnShutdown"/' user.js
	sed -i 's/pref("places.history.enabled"/\/\/BRACE-DISABLED: pref("places.history.enabled"/' user.js
	sed -i 's/pref("browser.cache.disk.enable"/\/\/BRACE-DISABLED: pref("browser.cache.disk.enable"/' user.js
	sed -i 's/pref("browser.cache.disk_cache_ssl"/\/\/BRACE-DISABLED: pref("browser.cache.disk_cache_ssl"/' user.js
	sed -i 's/pref("browser.download.manager.retention"/\/\/BRACE-DISABLED: pref("browser.download.manager.retention"/' user.js
	sed -i 's/pref("signon.rememberSignons"/\/\/BRACE-DISABLED: pref("signon.rememberSignons"/' user.js
	sed -i 's/pref("network.cookie.lifetimePolicy"/\/\/BRACE-DISABLED: pref("network.cookie.lifetimePolicy"/' user.js
	sed -i 's/pref("browser.urlbar.autocomplete.enabled"/\/\/BRACE-DISABLED: pref("browser.urlbar.autocomplete.enabled"/' user.js
	sed -i 's/pref("security.OCSP.enabled"/\/\/BRACE-DISABLED: pref("security.OCSP.enabled"/' user.js
	sed -i 's/pref("security.OCSP.required"/\/\/BRACE-DISABLED: pref("security.OCSP.required"/' user.js

	#Enable some preferences
	sed -i 's/\/\/pref("security.ssl.require_safe_negotiation"/pref("security.ssl.require_safe_negotiation"/' user.js #XXX: Breaks some sites

	#Fix https://github.com/pyllyukko/user.js/issues/347
	sed -i 's/pref("browser.cache.offline.enable"/\/\/DISABLED: pref("browser.cache.offline.enable"/' user.js

	#Fix https://github.com/pyllyukko/user.js/pull/355
	sed -i 's/en-us, en/en-US/' user.js

	#Add our extras
	echo -e "\n" >> user.js;
	echo "//START OF BRACE EXTRAS" >> user.js;
	##Performance
	echo 'pref("general.smoothScroll", false);' >> user.js;
	echo 'pref("layers.acceleration.force-enabled", true);' >> user.js;
	echo 'pref("media.hardware-video-decoding.force-enabled", true);' >> user.js;
	echo 'pref("browser.tabs.remote.autostart", true);' >> user.js;
	echo 'pref("browser.tabs.remote.force-enabled", true);' >> user.js;
	echo 'pref("layers.omtp.enabled", true);' >> user.js;
	##Privacy
	echo 'pref("privacy.firstparty.isolate", true);' >> user.js;
	echo 'pref("privacy.firstparty.isolate.restrict_opener_access", false);' >> user.js;
	echo 'pref("extensions.screenshots.disabled", true);' >> user.js;
	echo 'pref("media.eme.enabled", false);' >> user.js;
	echo 'pref("general.useragent.updates.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.updateUrl", "");' >> user.js;
	echo 'pref("browser.snippets.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.syncPromo.enabled", false);' >> user.js;
	echo 'pref("browser.snippets.firstrunHomepage.enabled", false);' >> user.js;
	echo 'pref("dom.push.serverURL", "");' >> user.js;
	echo 'pref("dom.push.enabled", false);' >> user.js;
	echo 'pref("plugin.expose_full_path", false);' >> user.js;
	echo 'pref("browser.link.open_newwindow_restriction", true);' >> user.js;
	echo 'pref("reader.parse-on-load.enabled", false);' >> user.js;
	echo 'pref("browser.reader.detectedFirstArticle", true);' >> user.js;
	##Security
	echo 'pref("javascript.options.shared_memory", false);' >> user.js;
	echo "//END OF BRACE EXTRAS" >> user.js;
}

package() {
  cd "$srcdir"
  install -Dm755 umask.sh "$pkgdir"/etc/profile.d/umask.sh
  install -Dm644 blacklist-dma.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-dma.conf
  install -Dm644 blacklist-usbnet.conf "$pkgdir"/usr/lib/modprobe.d/blacklist-usbnet.conf
  install -Dm644 iwlwifi.conf "$pkgdir"/usr/lib/modprobe.d/iwlwifi.conf
  install -Dm644 21-disable-connectivity-check.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/21-disable-connectivity-check.conf
  install -Dm644 30-mac-randomization.conf "$pkgdir"/usr/lib/NetworkManager/conf.d/30-mac-randomization.conf
  install -Dm644 60-restrict.conf "$pkgdir"/usr/lib/sysctl.d/60-restrict.conf
  install -Dm644 dnu.service "$pkgdir"/usr/lib/systemd/system/dnu.service
  install -Dm644 user.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/all-brace.js
  install -Dm644 user.js "$pkgdir"/opt/firefox-nightly/browser/defaults/preferences/all-brace.js
}
