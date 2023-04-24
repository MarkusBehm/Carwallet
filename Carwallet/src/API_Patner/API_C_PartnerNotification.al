codeunit 50301 API_C_PartnerNotification
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;


    procedure sendWhatsappToCarAdvisor()
    var
        accountSid: Text;
        authToken: Text;
        PhoneNumber: Text;
        From: Text;
        Body: Text;
        uri: Text;
        _queryObj: TExt;
        accessToken: Text;
        responseText: Text;
        cusb64: Codeunit WaaS_C_Base64Convert;
        responseTextHTTP: HttpResponseMessage;


    begin
        uri := 'https://api.twilio.com/2010-04-01/Accounts/AC0c499232f1d52122dc144ecbccec738e/Messages.json';
        accountSid := 'AC0c499232f1d52122dc144ecbccec738e';
        authToken := '541ec26652b66794df3b4554dcc93908';
        PhoneNumber := '+4915140516977';
        From := '+4915140516977';
        Body := 'Car #WAT1243985Z934 is SOLD - Cashmovment Match: OK, Kind Regards your Porsche Holding Salzburg ServiceTeam';


        _queryObj := '{"To": "' + PhoneNumber + '","Body": "' + Body + '","From": "' + From + '"}';
        accessToken := cusb64.TextToBase64String(accountSid + ':' + authToken);






        //responseText := CheckCodeWebService(accessToken, _queryObj, uri);
        responseTextHTTP := CreateRequest_POST(uri, accessToken, _queryObj);

    end;



    procedure Request(uri: Text; _queryObj: Text; accessToken: Text; RMethod: Text; callCode: Code[100]; settingID: BigInteger) responseText: Text;
    var
        client: HttpClient;
        Content: HttpContent;
        Request: HttpRequestMessage;
        MessageText: Text;
        start: DateTime;
        ending: Datetime;
        response: HttpResponseMessage;
    begin
        // Add the payload to the content
        Content.WriteFrom(_queryObj);
        // Retrieve the  contentHeaders associated with the content
        Request.Content(Content);

        client.DefaultRequestHeaders().Add('Authorization', StrSubstNo('%1 %2', 'Basic', accessToken));

        Request.Method(RMethod);
        start := CurrentDateTime;


        if (RMethod = 'GET') then begin

            client.Get(uri, response);
            response.Content().ReadAs(responseText);

        end;
        //vAk7Q~cDNbKP_0a5AZHEB3iRPlUpCfjwmTziZ
        if (RMethod = 'POST') then begin
            responseText := CheckCodeWebService(accessToken, _queryObj, uri);


        end;

        ending := CurrentDateTime;





        if response.HttpStatusCode <> 200 then begin
        end;




    end;

    procedure CheckCodeWebService(_accessToken: Text; jsonRequest: Text; uri: Text) txtResponse: Text
    var
        //jsonRequest: Text;
        Url: Text;
        client: HttpClient;
        request: HttpRequestMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
        response: HttpResponseMessage;
    begin

        content.WriteFrom(jsonRequest);
        content.GetHeaders(contentHeaders);
        client.DefaultRequestHeaders().Add('Authorization', StrSubstNo('%1 %2', 'Basic ', _accessToken));
        /*
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');
        request.GetHeaders(contentHeaders);
        contentHeaders.Add('Authorization', StrSubstNo('Bearer %1', _accessToken));
        contentHeaders.Add('Accept', 'application/xml');
        contentHeaders.Add('idempotency-id', '123456789098765434');
        */
        request.Content := content;

        Url := uri;

        request.SetRequestUri(Url);
        request.Method := 'POST';
        client.Send(request, response);
        response.Content().ReadAs(txtResponse);
    end;






    procedure CreateRequest_POST(RequestUrl: Text;
    AccessToken: Text; postData: Text
    ): HttpResponseMessage
    var
        TempBlob: Codeunit "Temp Blob";
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        ResponseHeader: HttpResponseMessage;
        MailContentHeaders: HttpHeaders;
        Content: HttpContent;
        HttpHeadersContent: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        RequestMessage: HttpRequestMessage;
        JObject: JsonObject;
        ResponseStream: InStream;
        APICallResponseMessage: Text;
        StatusCode: Text;
        IsSuccessful: Boolean;
        JAccessToken: JsonObject;

    begin
        //BODY
        postData := postData;

        RequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();
        RequestHeaders.Add('Authorization', 'Basic ' + AccessToken);
        RequestHeaders.Add('Accept', '*/*');
        Content.WriteFrom(postData);

        //GET HEADERS
        Content.GetHeaders(HttpHeadersContent);
        HttpHeadersContent.Clear();
        HttpHeadersContent.Remove('Content-Type');
        HttpHeadersContent.Add('Content-Type', 'application/x-www-form-urlencoded');


        //POST METHOD
        RequestMessage.Content := Content;
        RequestMessage.SetRequestUri(RequestUrl);
        RequestMessage.Method := 'POST';

        // Clear(TempBlob);
        // TempBlob.CreateInStream(ResponseStream);

        Client.Send(RequestMessage, ResponseMessage);
        if ResponseMessage.IsSuccessStatusCode() then begin
            if ResponseMessage.Content.ReadAs(APICallResponseMessage) then
                IsSuccessful := JAccessToken.ReadFrom(APICallResponseMessage);
        end else
            if ResponseMessage.Content.ReadAs(APICallResponseMessage) then
                JAccessToken.ReadFrom(APICallResponseMessage);




        // ResponseMessage.Content().ReadAs(ResponseStream);
        // JObject.ReadFrom(ResponseStream);

        //API response
        //JObject.WriteTo(APICallResponseMessage);
        //APICallResponseMessage := APICallResponseMessage.Replace(',', '\');
        exit(ResponseMessage);
    end;
}