# Home Assistant Blocky Add-on

A Home Assistant add-on for [Blocky](https://github.com/0xERR0R/blocky), a fast and lightweight DNS proxy with advanced ad-blocking capabilities for your home network.

## Features

- 🛡️ **DNS Ad-Blocking**: Block ads, trackers, and malicious domains at the DNS level
- ⚡ **High Performance**: Fast DNS resolution with minimal resource usage
- 🏠 **Home Assistant Integration**: Seamless integration with your Home Assistant instance
- 📊 **Prometheus Metrics**: Built-in monitoring and statistics
- 🌐 **Host Network Access**: Direct network access for optimal DNS performance
- 🔒 **SSL Support**: Secure DNS over HTTPS (DoH) and DNS over TLS (DoT)
- 🔧 **Customizable**: Easily configure blocklists, upstream DNS servers, Query rewriting, and more

## Prerequisites

- Home Assistant OS or Supervised installation
- Home Assistant version 2021.3.0 or higher
- Access to Home Assistant add-on store

## Installation

1. **Add the Repository**:
   - Navigate to **Supervisor** → **Add-on Store** in your Home Assistant interface
   - Click the three dots menu (...) in the top right corner
   - Select **Repositories**
   - Add this repository URL: `https://github.com/zenobi-us/homeassistant-blocky`

2. **Install the Add-on**:
   - Find "Blocky" in the add-on store
   - Click **Install**
   - Wait for the installation to complete

3. **Configure the Add-on**:
   - Click **Configuration** tab
   - Set your timezone (e.g., `Europe/Berlin`, `America/New_York`)
   - Click **Save**

4. **Start the Add-on**:
   - Click **Start**
   - Enable **Auto-start** if desired
   - Check the **Log** tab for any errors

## Configuration

### Basic Configuration

The add-on requires minimal configuration to get started:

```yaml
timezone: "America/New_York"  # Your local timezone
```

### Advanced Configuration

For advanced Blocky configuration, you can create a custom configuration file in the `/addon_config/blocky/` directory. The add-on will automatically use this configuration.

Example advanced configuration options:
- Custom blocklists
- Upstream DNS servers
- Client-specific settings
- Conditional forwarding
- Custom DNS records

## Ports

The add-on exposes the following ports:

| Port | Protocol | Purpose |
|------|----------|---------|
| 53   | UDP/TCP  | DNS server |
| 4000 | TCP      | Prometheus metrics (optional) |

## Integration with Home Assistant

### DNS Configuration

1. **Router Configuration** (Recommended):
   - Set your router's DNS server to your Home Assistant IP address
   - This will apply DNS filtering to all devices on your network

2. **Device Configuration**:
   - Configure individual devices to use your Home Assistant IP as DNS server
   - Useful for testing or selective filtering

### Ingress Support

The add-on supports Home Assistant's ingress feature, allowing you to access Blocky's web interface directly through Home Assistant without exposing additional ports.

## Monitoring

### Prometheus Metrics

Blocky provides comprehensive metrics through Prometheus on port 4000:
- DNS query statistics
- Response times
- Blocked domains count
- Upstream server performance

### Home Assistant Sensors

You can create sensors in Home Assistant to monitor Blocky's performance:

```yaml
# Example configuration.yaml entry
sensor:
  - platform: rest
    resource: "http://localhost:4000/metrics"
    name: "Blocky Queries Total"
    value_template: "{{ value_json.queries_total }}"
```

## Troubleshooting

### Common Issues

1. **DNS Not Working**:
   - Verify the add-on is running
   - Check that port 53 is not blocked by your firewall
   - Ensure no other DNS servers are running on the same ports

2. **High CPU Usage**:
   - Check your blocklist configuration
   - Consider reducing the number of blocklists
   - Monitor query volume in the logs

3. **Slow DNS Resolution**:
   - Verify upstream DNS server configuration
   - Check network connectivity to upstream servers
   - Review cache settings

### Logs

Access detailed logs through:
- Home Assistant → Supervisor → Blocky → Log tab
- Command line: `ha addons logs blocky`

### Support

- [Blocky Documentation](https://0xerr0r.github.io/blocky/)
- [Report Issues](https://github.com/zenobi-us/homeassistant-blocky/issues)
- [Home Assistant Community Forum](https://community.home-assistant.io/)

## Security

This add-on runs with the following security considerations:
- **Host Network**: Required for DNS server functionality
- **Manager Role**: Needed for Home Assistant integration
- **SSL Support**: Encrypted configuration and data transmission

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

- [Blocky](https://github.com/0xERR0R/blocky) - The amazing DNS proxy this add-on is based on
- [Home Assistant](https://www.home-assistant.io/) - The open-source home automation platform
- The Home Assistant community for their continuous support and feedback

---

<div align="center">

**Enjoy ad-free browsing with Blocky!**

*Made with ❤️ for the Home Assistant community*

</div>