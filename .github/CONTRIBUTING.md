## Adding a New Image

To add a new image, create a new folder in `images/` with the name of the image,
and create at least one `Dockerfile` for it, using an extension as the tag. For
instance, an Ubuntu-based version of your image would be in `ubuntu.Dockerfile`.

New images should extend from existing images whenever possible, e.g.

```Dockerfile
FROM codercom/enterprise-base:ubuntu

# Rest of your image...
```
