# http-echo Helm Chart

A Helm chart for deploying multiple [hashicorp/http-echo](https://hub.docker.com/r/hashicorp/http-echo) instances.

## Installation

```bash
helm install http-echo ./echo
```

## Configuration

The chart deploys multiple http-echo instances defined in `values.yaml`:

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of replicas per instance | `1` |
| `image.repository` | Image repository | `hashicorp/http-echo` |
| `image.tag` | Image tag | `0.2.3` |
| `instances` | List of http-echo instances to deploy | See values.yaml |

### Instance Configuration

Each instance in the `instances` list can have:

| Parameter | Description |
|-----------|-------------|
| `name` | Instance name (used in resource names) |
| `text` | Response text returned by http-echo |
| `port` | Container port |
| `service.type` | Kubernetes service type |
| `service.port` | Service port |
| `ingress.enabled` | Enable ingress for this instance |
| `ingress.host` | Ingress hostname |
| `ingress.path` | Ingress path |

## Default Instances

By default, this chart deploys two instances:

1. **foo** - Returns "foo" at http://foo.localhost
2. **bar** - Returns "bar" at http://bar.localhost

## Testing

After installation, add to `/etc/hosts`:
```
127.0.0.1 foo.localhost bar.localhost
```

Then test:
```bash
curl http://foo.localhost
# Output: foo

curl http://bar.localhost
# Output: bar
```
