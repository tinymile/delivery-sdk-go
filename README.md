![1  tiny-mile-logo-black](https://user-images.githubusercontent.com/1395990/173195516-8a6dd2a7-85f9-4aea-a93c-2ce3afa3a894.png)

# Go Delivery SDK

We provide an HTTP API to make it easier for new partners to quickly integrate with us and start sending delivery requests our way. While you can use our API directly by making raw HTTP requests to it, we also provide client libraries in some languages to speed up development.

For the full documentation of the API, please see https://external-api.prod.gcp.tinymile.ai/doc.

For the development version, see https://external-api.dev.gcp.tinymile.ai/doc . This is the version this repository is synchronized with.

# Basic usage

```go
delivery_sdk.NewClientWithResponses(
        "https://external-api.prod.gcp.tinymile.ai",
		delivery_sdk.WithAPIKeyAuthentication(apiKey))
```

# API Compatibility

The API is versioned, so this SDK is guaranteed to have [forward compatibility](https://en.wikipedia.org/wiki/Forward_compatibility) with the API.

## Build

Clone this repo and run `make all` to build it.
