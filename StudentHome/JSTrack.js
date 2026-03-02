// JS track functions for ELMS
// (c) Softline 2007

function Add(a)
{
    wsElmsTrack.SendGet(a, SucceededCallback);
}

function SucceededCallback(result, eventArgs)
{
    // Page element to display feedback.
    var RsltElem = document.getElementById("ResultId");
    RsltElem.innerHTML = result;
    
    var RsltElem2 = this.frames.frmJSContent.document.getElementById("ResultId2");
    
    if (RsltElem2)
    {
        RsltElem2.innerHTML = result;        
    }
    
}



// LoId  - вычисляется при загрузке системы трекинга
// Score - передается из JS теста

function SendResult(LoId, Score, MaxScore, PassProcent, PassTime, ParentId, CourseId, StartTime)
{
    wsElmsTrack.SendResult(LoId, Score, MaxScore, PassProcent, PassTime, ParentId, CourseId, StartTime, SucceededCallback2);
}

function SucceededCallback2(result, eventArgs)
{
    // Page element to display feedback.
    var RsltElem = document.getElementById("ResultId");
    RsltElem.innerHTML = result;
    
    var RsltElem2 = this.frames.frmJSContent.document.getElementById("ResultId2");
    
    if (RsltElem2)
    {
        RsltElem2.innerHTML = result;        
    }
    
}