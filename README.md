# Secret Scanner

A Docker image that contains gitleaks from <https://github.com/zricethezav/gitleaks>,
and this image can be used to scan for secrets stored in git commits.

## Usage

```bash
docker run --volume $PWD:/src dfdsdk/secret-scanner:tagname
```

### Example

```bash
docker run --volume $PWD:/src dfdsdk/secret-scanner detect --verbose --redact
```
