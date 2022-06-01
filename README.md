# waggers-action

An action for fuzzing Swagger endpoints.

# Usage

See [action.yml](action.yml)

```yaml
steps:
- uses: mprencipe/waggers-action@v1
  with:
    url: https://url/swagger-endpoint.json
    fuzzcount: 3
```

# Disclaimer
The author does not take any responsibility for the use of this action.

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
