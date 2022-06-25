package delivery_sdk

import (
	"context"
	"fmt"
	"net/http"
)

func WithAPIKeyAuthentication(apiKey string) ClientOption {
	authHeader := fmt.Sprintf("Bearer %s", apiKey)

	return WithRequestEditorFn(func(_ context.Context, req *http.Request) error {
		req.Header.Add("Authorization", authHeader)
		return nil
	})
}
