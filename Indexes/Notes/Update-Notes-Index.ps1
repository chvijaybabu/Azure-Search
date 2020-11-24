$primaryKey = Get-AzSearchAdminKeyPair -ResourceGroupName "#{Azure.Search.ResourceGroupName}" -ServiceName "#{Azure.Search.InstanceName}" | Select-Object -ExpandProperty Primary
$queryKey = Get-AzSearchQueryKey -ResourceGroupName "#{Azure.Search.ResourceGroupName}" -ServiceName "#{Azure.Search.InstanceName}" | Select-Object -ExpandProperty Key
#Update the Octopus Global Params with the apiKeys.

$headers = @{
    "api-key" = $primaryKey
    "Content-Type" = "application/json"
}
$uri = 'https://#{Azure.Search.InstanceName}.search.windows.net/indexes/#{Azure.Search.NotesIndexName}?api-version=2019-05-06'
$body = '{
  "name": "#{Azure.Search.NotesIndexName}",
  "fields": [
    {
      "name": "doc_id",
      "type": "Edm.String",
      "facetable": false,
      "filterable": true,
      "key": true,
      "retrievable": true,
      "searchable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "LastIndexed",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "DocumentType",
      "type": "Edm.String",
      "facetable": false,
      "filterable": true,
      "key": false,
      "retrievable": true,
      "searchable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "OwnerOrgID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "ParentOrgID",
      "type": "Collection(Edm.Int32)",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "CreatedByOrgID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "DiscussionID",
      "type": "Edm.Int32",
      "facetable": true,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "ApplicantID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "AssignedUserID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskAssignedUserIDs",
      "type": "Collection(Edm.Int32)",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskAssignedDepartmentAgencyID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskAssignedDepartmentAgencyOnlyID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskAssignedOrgIDs",
      "type": "Collection(Edm.Int32)",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Created",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "CreatedBy",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "LastModified",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Deleted",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "DeletedDate",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "DiscussionLastModified",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Title",
      "type": "Edm.String",
      "facetable": false,
      "filterable": true,
      "key": false,
      "retrievable": true,
      "searchable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": "EzFrontAnalyzer",
      "searchAnalyzer": "EzQueryAnalyzer",
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "NoteID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Note",
      "type": "Edm.String",
      "facetable": false,
      "filterable": true,
      "key": false,
      "retrievable": true,
      "searchable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": "EzFrontAnalyzer",
      "searchAnalyzer": "EzQueryAnalyzer",
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Labels",
      "type": "Collection(Edm.String)",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "searchable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskID",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "TaskDescription",
      "type": "Edm.String",
      "facetable": false,
      "filterable": true,
      "key": false,
      "retrievable": true,
      "searchable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": "EzTitleDescIndexAnalyzer",
      "searchAnalyzer": "EzTitleDescQueryAnalyzer",
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "Status",
      "type": "Edm.Int32",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": false,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "DueDate",
      "type": "Edm.DateTimeOffset",
      "facetable": false,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    },
    {
      "name": "IsImportant",
      "type": "Edm.Boolean",
      "facetable": true,
      "filterable": true,
      "retrievable": true,
      "sortable": true,
      "analyzer": null,
      "indexAnalyzer": null,
      "searchAnalyzer": null,
      "synonymMaps": [],
      "fields": []
    }
  ],
  "suggesters": [],
  "scoringProfiles": [],
  "defaultScoringProfile": "",
  "corsOptions": {
    "allowedOrigins": [
      "*"
    ],
    "maxAgeInSeconds": null
  },
  "analyzers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "EzFrontAnalyzer",
      "tokenizer": "whitespace",
      "tokenFilters": [
        "front_filter",
        "lowercase"
      ],
      "charFilters": [
        "PatternReplaceFilter"
      ]
    },    
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "EzQueryAnalyzer",
      "tokenizer": "whitespace",
      "tokenFilters": [
        "lowercase"
      ],
      "charFilters": [
        "PatternReplaceFilter"
      ]
    },
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "EzTitleDescQueryAnalyzer",
      "tokenizer": "whitespace",
      "tokenFilters": [
        "lowercase"
      ],
      "charFilters": []
    },
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "EzTitleDescIndexAnalyzer",
      "tokenizer": "whitespace",
      "tokenFilters": [
      	"front_filter",
        "lowercase"
      ],
      "charFilters": []
    }
  ],
  "charFilters": [
    {
      "@odata.type": "#Microsoft.Azure.Search.PatternReplaceCharFilter",
      "name": "PatternReplaceFilter",
      "pattern": "([^\\da-zA-Z])",
      "replacement": " "
    }
  ],
  "tokenFilters": [
    {
      "@odata.type": "#Microsoft.Azure.Search.EdgeNGramTokenFilterV2",
      "name": "front_filter",
      "minGram": 1,
      "maxGram": 100,
      "side": "front"
    },
    {
      "@odata.type": "#Microsoft.Azure.Search.EdgeNGramTokenFilterV2",
      "name": "back_filter",
      "minGram": 1,
      "maxGram": 100,
      "side": "back"
    }
  ],
  "tokenizers": [],
  "@odata.etag": "\"0x8D74DC882EA7052\""
}
'
Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -Body $body 