# devOps

<b>How to create Cloudfront from scratch via terraform?</b><br/>
Install terraform <br/>
Download link : https://www.terraform.io/downloads.html<br/>
Configure aws CLI <br/>
Create cloudfront.tf file <br/>
Create variable.tf file <br/>
both above mention files are present with repo.<br/>

It includes <b>custom_header</b> which is useful in allow <b></i> [cross origin](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)</b></i>. It helps in solving <b></i>[CORS issue](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)</b></i>
Example:
`    custom_header = {
      name  = "Access-Control-Allow-Origin"
      value = "*"
    }`
