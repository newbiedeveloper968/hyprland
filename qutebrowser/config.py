# vim: fdm=marker

config.load_autoconfig()

c.tabs.background = True
c.new_instance_open_target = "window"
c.downloads.position = "top"
c.fonts.default_family = "JetBrainsMono NF"
c.fonts.default_size = "16pt"
c.fonts.statusbar = '10pt JetBrainsMono NF'

c.search.incremental = False

# ==================================================
# Statusbar — hidden unless needed
# ==================================================
c.statusbar.show = 'in-mode'
c.statusbar.padding = {'top': 2, 'bottom': 2, 'left': 6, 'right': 6}
c.tabs.padding = {
    'top': 8,
    'bottom': 8,
    'left': 6,
    'right': 6,
}

# config.source("gruvbox.py")
config.set("zoom.default", "140%")
config.bind('M', 'hint links spawn --detach mpv --force-window=immediate {hint-url}')
config.bind('m', 'spawn --detach mpv --force-window=immediate {url}')

# set dark mode
c.colors.webpage.bg = "black"  # "black" get's rid of flashes, but does seem to break certain websites
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.threshold.foreground = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = 'never' # 'smart-simple'

c.qt.args = ["blink-settings=darkMode=4"]

# always restore open sites when qutebrowser is reopened
c.auto_save.session = True
