# Node-RED Hass.io Add-On
---------

[Hass.io](https://home-assistant.io/hassio/) add-on for [Node-RED](https://nodered.org/).

## Installation

1. Add my [Hass.io](https://home-assistant.io/hassio/) add-on [repository](https://github.com/notoriousbdg/hassio-addons)
2. Install the "Node-RED" add-on
3. (Optional) To enable SSL support, set SSL to true

    ```json
    {
      "ssl": true,
      "certfile": "fullchain.pem",
      "keyfile": "privkey.pem"
    }
    ```

4. Start the "Node-RED" add-on
5. (Optional) Configure [panel_iframe](https://home-assistant.io/components/panel_iframe/) component to embed Node-RED UI into Home Assistant UI using this example:

    ```yaml
    iframe_panel:
      nodered_flows:
        title: 'Node-RED Flows'
        url: 'http://hassio.local:1880'
        icon: mdi:nodejs
    ```

6. (Optional) If you install [Node-RED Dashboard](https://github.com/node-red/node-red-dashboard) in Node-RED, you can expose the dashboard in the [Hass.io](https://home-assistant.io/hassio/) UI using this example to your [panel_iframe](https://home-assistant.io/components/panel_iframe/) section:

    ```yaml
    iframe_panel:
      nodered_ui:
        title: 'Node-RED Dashboard'
        url: 'http://hassio.local:1880/ui'
        icon: mdi:nodejs
    ```

## Support

Please use [this thread](https://community.home-assistant.io/t/repository-notoriousbdg-add-ons-node-red-and-ha-bridge/23247) for feedback.

## Changelog

### 0.1.0 (2017-07-31)
#### Initial Release

### 0.1.1 (2017-08-10)
#### Added
- Option to enable SSL
