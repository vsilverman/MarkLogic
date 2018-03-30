xquery version "0.9-ml"

import module namespace s="http://marklogic.com/bill/search"
 at "search-lib.xqy"

declare namespace apidoc="http://marklogic.com/xdmp/apidoc"

define variable $g-query {
  fn:normalize-space(xdmp:get-request-field("query"))
}

xdmp:set-response-content-type("text/html; charset=utf-8"),

<html>
	<head>
	    <title>Search for {$g-query}</title>
	</head>
	<body>
	{	
		let $q-query := xdmp:get-request-field("query")
	    return 
			<h2>The Plays of William Shakespeare - Searched Word: <span style="background-color: #FFFF00">{$q-query}</span> </h2>
	}

	{
      for $play in xdmp:directory("/shakespeare/plays/")
      return 
      	<pre> 
         <b>FILE: {fn:document-uri($play)}</b>
          {
			for $line in $play//LINE
			where contains(data($line), xdmp:get-request-field("query"))   
			return 
				<li>
					{cts:highlight($line, xdmp:get-request-field("query"), <span style="background-color: #FFFF00">{$cts:text}</span>)[1 to 50]}
				</li>    
      	  }
      	</pre>	
    }

	</body>
</html>    
