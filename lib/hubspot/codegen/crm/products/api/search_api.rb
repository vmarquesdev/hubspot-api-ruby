=begin
#Products

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.2

=end

require 'cgi'

module Hubspot
  module Client
    module Crm
      module Products
        module Api
          class SearchApi
            attr_accessor :api_client

            def initialize(api_client = ApiClient.default)
              @api_client = api_client
            end
            # Filter, Sort, and Search CRM Objects
            # # Filter, Sort, and Search CRM Objects  The CRM Search API is a powerful API that allows developers to filter, sort, and search across all product types, including contacts, deals, companies and tickets. Using this API, developers can more efficiently retrieve a subset of data they are looking for to better suit their business needs.  Common use cases this API allows for include, but are not limited to the following: <ul> <li>Getting a list of contacts for a specific account</li> <li>Retrieving a list of all open deals</li> <li>Searching for contacts by custom properties</li> <li>& more</li> </ul>  Prerequisite for using this API: To use the CRM Search API with an OAuth token, your app must request and be granted access to the contacts scope.  <br /> `engagements` including `tasks`, `calls`, `emails`, and `notes` are not supported.  <br /> ## Filter  Use `filterGroups` in the request body to limit results to specific CRM products.  *Example*: Find all contacts with a first name of \"Alice\" ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"filterGroups\":[     {       \"filters\":[         {           \"propertyName\": \"firstname\",           \"operator\": \"EQ\",           \"value\": \"Alice\"         }       ]     }]   }' ```  When multiple `filters` are provided within a `filterGroup`, they will be combined using a logical `AND` operator. When multiple `filterGroup`s are provided, they will be combined using a logical `OR` operator. The system supports a maximum of three `filterGroups` with up to three `filters` per `filterGroup`.  *Example*: Find all contacts with (a first name of \"Alice\" `AND` a last name that is not \"Smith\") OR has the property \"enum1\" ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"filterGroups\":[     {       \"filters\": [         {           \"propertyName\": \"firstname\",           \"operator\": \"EQ\",           \"value\": \"Alice\"         },         {           \"propertyName\": \"lastname\",           \"operator\": \"NEQ\",           \"value\": \"Smith\"         }       ]     },     {       \"filters\": [         {           \"property\": \"enum1\",           \"operator\": \"HAS_PROPERTY\"         }       ]     }]   }' ```   <br /> ### Operators  Supported operators include: |Operator|Description| |--|--| |`EQ`| equal to | |`NEQ`| not equal to | |`LT`| less than | |`LTE`| less than or equal to | |`GT`| greater than | |`GTE`| greater than or equal to | |`HAS_PROPERTY`| has the property | |`NOT_HAS_PROPERTY`| does not have the property | |`CONTAINS_TOKEN`| contains token, strings only | |`NOT_CONTAINS_TOKEN`| not contains token, strings only |  <br /> ### Associations You can find products associated with a different object type by ID using the `associations.products` psuedo-property. Support for this is limited to `deals` and `tickets`.  Supported association filters: |Object Type |Filter `propertyName` | |--|--| | `deals` | `associations.company`, `associations.contact`, `associations.ticket` | | `tickets` | `associations.company`, `associations.contact`, `associations.deal` |  *Example*: Find all tickets associated with the contact using ID \"123\" ``` curl --request POST https://api.hubapi.com/crm/v3/products/tickets/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"filters\": [       {         \"propertyName\": \"associations.contact\",         \"operator\": \"EQ\",         \"value\": \"123\"       }     ]   }' ```  <br /> ## Sort  Use `sorts`, which contain a property name and a direction, to sort the returned collection.  *Example*: List all contacts with most recently created first ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"sorts\": [       {         \"propertyName\": \"createdate\",         \"direction\": \"DESCENDING\"       }     ]   }' ``` The system supports a single sort.   <br /> ## Search  Perform a text search against all property values for a product type. By default, the results will be returned in order of object creation (oldest first) but this can be overridden using `sorts`.  *Example*: Find all contacts with a property value containing the letter `x` ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"query\": \"x\"   }' ```  <br /> ## Controlling returned properties  Each object type is returned with a default set of properties. You can override this by providing an array of property names in the `properties` property of the request body.  *Example*: Return all contacts and include their email and mailing address state ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"properties\": [ \"email\", \"state\" ]   }' ```  <br /> ## Paging through results By default, the Search API returns results containing 10 products per page. The system supports a maximum of 100 results per page.  *Example*: Get pages of size 20 ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"limit\": 20   } ```  In order to access the next page of results, you must pass the `after` parameter that was provided in the previous response in the `paging.next.after` property. If no `paging.next.after` property is provided, no additional results will be shown. Note that the after parameter is expected to be a string.  *Example*: Get the next page of results ``` curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey=demo \\   --header \"Content-Type: application/json\" \\   --data '{     \"after\": \"20\"   }' ```  <br /> ## Sample Response (Success)  ``` {   \"results\": [     {       \"id\": \"174\",       \"properties\": {         \"firstname\": \"Brantley\",         \"lastname\": \"Forrest\",         \"email\": \"bforrest8@acme.com\"       },       \"createdAt\":\"2019-10-30T03:30:17.883Z\",       \"updatedAt\": \"1569516907T16:50:06.678Z\",       \"archived\": false     },     ...   ],   \"paging\": {     \"next\": {       \"after\": \"10\"     }   } } ```  <br /> ## Limitations  1. It can take a few moments between creating or updating a product in HubSpot and seeing it in CRM Search API results. 2. CRM products in an archived state will not be available in the Search API. 3. The Search API is rate limited to 1 request per second per authentication token, which is more stringent than our general rate limits. The `X-HubSpot-RateLimit-*` headers will not reflect this during the beta period. Read more about [rate limits](https://developers.hubspot.com/docs/faq/working-within-the-hubspot-api-rate-limits).  <br /> ## Error Handling Read our [error documentation](https://developers.hubspot.com/docs/faq/api-error-responses).
            # @param [Hash] opts the optional parameters
            # @option opts [PublicObjectSearchRequest] :public_object_search_request 
            # @return [CollectionResponseWithTotalSimplePublicObject]
            def do_search(opts = {})
              data, _status_code, _headers = do_search_with_http_info(opts)
              data
            end

            # Filter, Sort, and Search CRM Objects
            # # Filter, Sort, and Search CRM Objects  The CRM Search API is a powerful API that allows developers to filter, sort, and search across all product types, including contacts, deals, companies and tickets. Using this API, developers can more efficiently retrieve a subset of data they are looking for to better suit their business needs.  Common use cases this API allows for include, but are not limited to the following: &lt;ul&gt; &lt;li&gt;Getting a list of contacts for a specific account&lt;/li&gt; &lt;li&gt;Retrieving a list of all open deals&lt;/li&gt; &lt;li&gt;Searching for contacts by custom properties&lt;/li&gt; &lt;li&gt;&amp; more&lt;/li&gt; &lt;/ul&gt;  Prerequisite for using this API: To use the CRM Search API with an OAuth token, your app must request and be granted access to the contacts scope.  &lt;br /&gt; &#x60;engagements&#x60; including &#x60;tasks&#x60;, &#x60;calls&#x60;, &#x60;emails&#x60;, and &#x60;notes&#x60; are not supported.  &lt;br /&gt; ## Filter  Use &#x60;filterGroups&#x60; in the request body to limit results to specific CRM products.  *Example*: Find all contacts with a first name of \&quot;Alice\&quot; &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;filterGroups\&quot;:[     {       \&quot;filters\&quot;:[         {           \&quot;propertyName\&quot;: \&quot;firstname\&quot;,           \&quot;operator\&quot;: \&quot;EQ\&quot;,           \&quot;value\&quot;: \&quot;Alice\&quot;         }       ]     }]   }&#39; &#x60;&#x60;&#x60;  When multiple &#x60;filters&#x60; are provided within a &#x60;filterGroup&#x60;, they will be combined using a logical &#x60;AND&#x60; operator. When multiple &#x60;filterGroup&#x60;s are provided, they will be combined using a logical &#x60;OR&#x60; operator. The system supports a maximum of three &#x60;filterGroups&#x60; with up to three &#x60;filters&#x60; per &#x60;filterGroup&#x60;.  *Example*: Find all contacts with (a first name of \&quot;Alice\&quot; &#x60;AND&#x60; a last name that is not \&quot;Smith\&quot;) OR has the property \&quot;enum1\&quot; &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;filterGroups\&quot;:[     {       \&quot;filters\&quot;: [         {           \&quot;propertyName\&quot;: \&quot;firstname\&quot;,           \&quot;operator\&quot;: \&quot;EQ\&quot;,           \&quot;value\&quot;: \&quot;Alice\&quot;         },         {           \&quot;propertyName\&quot;: \&quot;lastname\&quot;,           \&quot;operator\&quot;: \&quot;NEQ\&quot;,           \&quot;value\&quot;: \&quot;Smith\&quot;         }       ]     },     {       \&quot;filters\&quot;: [         {           \&quot;property\&quot;: \&quot;enum1\&quot;,           \&quot;operator\&quot;: \&quot;HAS_PROPERTY\&quot;         }       ]     }]   }&#39; &#x60;&#x60;&#x60;   &lt;br /&gt; ### Operators  Supported operators include: |Operator|Description| |--|--| |&#x60;EQ&#x60;| equal to | |&#x60;NEQ&#x60;| not equal to | |&#x60;LT&#x60;| less than | |&#x60;LTE&#x60;| less than or equal to | |&#x60;GT&#x60;| greater than | |&#x60;GTE&#x60;| greater than or equal to | |&#x60;HAS_PROPERTY&#x60;| has the property | |&#x60;NOT_HAS_PROPERTY&#x60;| does not have the property | |&#x60;CONTAINS_TOKEN&#x60;| contains token, strings only | |&#x60;NOT_CONTAINS_TOKEN&#x60;| not contains token, strings only |  &lt;br /&gt; ### Associations You can find products associated with a different object type by ID using the &#x60;associations.products&#x60; psuedo-property. Support for this is limited to &#x60;deals&#x60; and &#x60;tickets&#x60;.  Supported association filters: |Object Type |Filter &#x60;propertyName&#x60; | |--|--| | &#x60;deals&#x60; | &#x60;associations.company&#x60;, &#x60;associations.contact&#x60;, &#x60;associations.ticket&#x60; | | &#x60;tickets&#x60; | &#x60;associations.company&#x60;, &#x60;associations.contact&#x60;, &#x60;associations.deal&#x60; |  *Example*: Find all tickets associated with the contact using ID \&quot;123\&quot; &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/tickets/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;filters\&quot;: [       {         \&quot;propertyName\&quot;: \&quot;associations.contact\&quot;,         \&quot;operator\&quot;: \&quot;EQ\&quot;,         \&quot;value\&quot;: \&quot;123\&quot;       }     ]   }&#39; &#x60;&#x60;&#x60;  &lt;br /&gt; ## Sort  Use &#x60;sorts&#x60;, which contain a property name and a direction, to sort the returned collection.  *Example*: List all contacts with most recently created first &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;sorts\&quot;: [       {         \&quot;propertyName\&quot;: \&quot;createdate\&quot;,         \&quot;direction\&quot;: \&quot;DESCENDING\&quot;       }     ]   }&#39; &#x60;&#x60;&#x60; The system supports a single sort.   &lt;br /&gt; ## Search  Perform a text search against all property values for a product type. By default, the results will be returned in order of object creation (oldest first) but this can be overridden using &#x60;sorts&#x60;.  *Example*: Find all contacts with a property value containing the letter &#x60;x&#x60; &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;query\&quot;: \&quot;x\&quot;   }&#39; &#x60;&#x60;&#x60;  &lt;br /&gt; ## Controlling returned properties  Each object type is returned with a default set of properties. You can override this by providing an array of property names in the &#x60;properties&#x60; property of the request body.  *Example*: Return all contacts and include their email and mailing address state &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;properties\&quot;: [ \&quot;email\&quot;, \&quot;state\&quot; ]   }&#39; &#x60;&#x60;&#x60;  &lt;br /&gt; ## Paging through results By default, the Search API returns results containing 10 products per page. The system supports a maximum of 100 results per page.  *Example*: Get pages of size 20 &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;limit\&quot;: 20   } &#x60;&#x60;&#x60;  In order to access the next page of results, you must pass the &#x60;after&#x60; parameter that was provided in the previous response in the &#x60;paging.next.after&#x60; property. If no &#x60;paging.next.after&#x60; property is provided, no additional results will be shown. Note that the after parameter is expected to be a string.  *Example*: Get the next page of results &#x60;&#x60;&#x60; curl --request POST https://api.hubapi.com/crm/v3/products/contacts/search?hapikey&#x3D;demo \\   --header \&quot;Content-Type: application/json\&quot; \\   --data &#39;{     \&quot;after\&quot;: \&quot;20\&quot;   }&#39; &#x60;&#x60;&#x60;  &lt;br /&gt; ## Sample Response (Success)  &#x60;&#x60;&#x60; {   \&quot;results\&quot;: [     {       \&quot;id\&quot;: \&quot;174\&quot;,       \&quot;properties\&quot;: {         \&quot;firstname\&quot;: \&quot;Brantley\&quot;,         \&quot;lastname\&quot;: \&quot;Forrest\&quot;,         \&quot;email\&quot;: \&quot;bforrest8@acme.com\&quot;       },       \&quot;createdAt\&quot;:\&quot;2019-10-30T03:30:17.883Z\&quot;,       \&quot;updatedAt\&quot;: \&quot;1569516907T16:50:06.678Z\&quot;,       \&quot;archived\&quot;: false     },     ...   ],   \&quot;paging\&quot;: {     \&quot;next\&quot;: {       \&quot;after\&quot;: \&quot;10\&quot;     }   } } &#x60;&#x60;&#x60;  &lt;br /&gt; ## Limitations  1. It can take a few moments between creating or updating a product in HubSpot and seeing it in CRM Search API results. 2. CRM products in an archived state will not be available in the Search API. 3. The Search API is rate limited to 1 request per second per authentication token, which is more stringent than our general rate limits. The &#x60;X-HubSpot-RateLimit-*&#x60; headers will not reflect this during the beta period. Read more about [rate limits](https://developers.hubspot.com/docs/faq/working-within-the-hubspot-api-rate-limits).  &lt;br /&gt; ## Error Handling Read our [error documentation](https://developers.hubspot.com/docs/faq/api-error-responses).
            # @param [Hash] opts the optional parameters
            # @option opts [PublicObjectSearchRequest] :public_object_search_request 
            # @return [Array<(CollectionResponseWithTotalSimplePublicObject, Integer, Hash)>] CollectionResponseWithTotalSimplePublicObject data, response status code and response headers
            def do_search_with_http_info(opts = {})
              if @api_client.config.debugging
                @api_client.config.logger.debug 'Calling API: SearchApi.do_search ...'
              end
              # resource path
              local_var_path = '/products/search'

              # query parameters
              query_params = opts[:query_params] || {}

              # header parameters
              header_params = opts[:header_params] || {}
              # HTTP header 'Accept' (if needed)
              header_params['Accept'] = @api_client.select_header_accept(['application/json', '*/*'])
              # HTTP header 'Content-Type'
              header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

              # form parameters
              form_params = opts[:form_params] || {}

              # http body (model)
              post_body = opts[:body] || @api_client.object_to_http_body(opts[:'public_object_search_request']) 

              # return_type
              return_type = opts[:return_type] || 'CollectionResponseWithTotalSimplePublicObject' 

              # auth_names
              auth_names = opts[:auth_names] || ['hapikey', 'oauth2']

              new_options = opts.merge(
                :header_params => header_params,
                :query_params => query_params,
                :form_params => form_params,
                :body => post_body,
                :auth_names => auth_names,
                :return_type => return_type
              )

              data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
              if @api_client.config.debugging
                @api_client.config.logger.debug "API called: SearchApi#do_search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
              end
              return data, status_code, headers
            end
          end
        end
      end
    end
  end
end