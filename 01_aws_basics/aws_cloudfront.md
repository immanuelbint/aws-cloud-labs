# CloudFront

## CloudFront Caching
- Cache lives at each CloudFront Edge Location, used to maximize the cache hit rate to minimaze requests on the origin
- Control the TTL (from 0 sec to 1 year), can be set by the origin using the Cache Control header, Expires header
- You can invalidate part of the cache using the CreateInvalidation API

Cache is based on
- Headers
- Session Cookies
- Query String Parameters

## CloudFront Origin Headers vs Cache Behavior

Origin Custom Header
- origin level setting
- set a constant header / header value for all request to origin

Behavior setting
- cache related settings
- contains the whitelist of headers to forward

## CloudFront Caching TTL

- "Cache-Control: max-age" is preferred to "Expires" header
- if the origin always sends back the header Cache-Control, then you can set the TTL to be controled by that header
- in case wanna set min/max boundaries, you choose "customize" for the Object Caching setting
- in case Cache-Control header is missing, it will default to "default value"

## CloudFront Cache Behaviour for Cookies

Cookies is specific request header

1. Default do not process the cookies
    - caching is not based on cookies
    - cookies are not forwarded
2. Forward a whitelist of cookies
    - caching based on values in all the specified cookies
3. Forward all cookies
    - worst caching performance
