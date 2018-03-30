xquery version "0.9-ml"

declare namespace apidoc="http://marklogic.com/xdmp/apidoc"

xdmp:set-response-content-type("text/html"),

<html>
	<head></head>
	<body>
	<h2>The Plays of William Shakespeare</h2>
	
	{
      for $play in xdmp:directory("/shakespeare/plays/")
      order by $play/PLAY/TITLE/text() descending
      return
          <li>
			{
	          $play/PLAY/TITLE/text()
            }
          </li>

    }
</body>
</html>    
