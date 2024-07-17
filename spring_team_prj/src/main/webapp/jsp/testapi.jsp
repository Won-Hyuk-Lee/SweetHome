<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>API Test</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>API Test Page</h1>
    <button id="apiRequestButton">Send API Request</button>
    <div id="apiResponse"></div>

    <script>
        $(document).ready(function() {
            $('#apiRequestButton').click(function() {
                $.ajax({
                    url: '/api/test',
                    method: 'GET',
                    success: function(response) {
                        $('#apiResponse').html('<pre>' + JSON.stringify(response, null, 2) + '</pre>');
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        $('#apiResponse').html('Error: ' + textStatus);
                    }
                });
            });
        });
    </script>
</body>
</html>
