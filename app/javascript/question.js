$(function(){
    var quizArea = $('.question');
    var quiz_html = quizArea.html();
    var quiz_cnt = 0;
    var quiz_fin_cnt = 5; //設問数
    var quiz_success_cnt = 0; //問題の正解数
    //クイズの配列を設定
    var trialQuiz = [];
    var questions = gon.questions
    var answers = gon.choise 

    let setquestions = [];
    for (i=0;i<questions.length;i++)
    {
    setquestions.push(questions[i].questions)
    }

    let setanswers =[];
    for(i=0;i<answers.length;i++)
    {
    setanswers.push(answers[i]['content']);
    }

    trialQuiz.push(
        {
            question : setquestions[0],
            answer : [setanswers[0], setanswers[1], setanswers[2]]
        }
        ,{
            question : setquestions[1],
            answer : [setanswers[3], setanswers[4], setanswers[5]]
        }
        ,{
            question : setquestions[2],
            answer : [setanswers[6], setanswers[7], setanswers[8]]
        }
        ,{
            question : setquestions[3],
            answer : [setanswers[9], setanswers[10], setanswers[11]]
        }
        ,{
            question : setquestions[4],
            answer : [setanswers[12], setanswers[13], setanswers[14]]
        }
        ,{
            question : setquestions[5],
            answer : [setanswers[15], setanswers[16], setanswers[17]]
        }
        ,{
            question : setquestions[6],
            answer : [setanswers[18], setanswers[19], setanswers[20]]
        }
        ,{
            question : setquestions[7],
            answer : [setanswers[21], setanswers[22], setanswers[23]]
        }
        ,{
            question : setquestions[8],
            answer : [setanswers[24], setanswers[25], setanswers[26]]
        }
        ,{
            question : setquestions[9],
            answer : [setanswers[27], setanswers[28], setanswers[29]]
        }
    );
    
    
    quizReset();
    
    //回答を選択した後の処理
    quizArea.on('click', '.question__select__choise li', function(){
        //答えをクリック後の暗転
        quizArea.find('.question__select__back').show();
        //クリック後の成否
        if($(this).data('true')){
            //正「〇」を表示
            quizArea.find('.question__select__icon').addClass('true');
            //正解数をカウント
            quiz_success_cnt++;
        }else{
            //不「×」を表示
            quizArea.find('.question__select__icon').addClass('false');
        }
        setTimeout(function(){
            //表示を元に戻す
            quizArea.find('.question__select__choise').removeClass('selected');
            quizArea.find('.question__select__icon').removeClass('true false');
            quizArea.find('.question__select__back').hide();
            //問題カウント
            quiz_cnt++;
            if(quiz_fin_cnt > quiz_cnt){
                //次の問題
                quizShow();
            }else{
                //結果表示画面を表示
                quizResult();
            }
        }, 1000);
    });
    
    //リセットを行う関数
    function quizReset(){
        quizArea.html(quiz_html); //表示を元に戻す
        quiz_cnt = 0;
        quiz_success_cnt = 0;
        //trialQuiz = arrShuffle(trialQuiz); //シャッフル
        quizShow();
    }
    
    //問題を表示する関数
    function quizShow(){
        //問題文
        quizArea.find('.question__main__clock').text(trialQuiz[quiz_cnt]['question']);
        //正解の回答
        var success = trialQuiz[quiz_cnt]['answer'][0];
        //現在の選択肢表示を削除する
        quizArea.find('.question__select__choise').empty();
        //問題文の選択肢をシャッフルさせる
        var shuffle = arrShuffle(trialQuiz[quiz_cnt]['answer'].concat());
        //問題文の配列を繰り返し表示する
        $.each(shuffle, function(key, value){
            var fuga = '<li>' + value + '</li>';
            //正解の場合はdata属性を付与する
            if(success === value){
                fuga = '<li data-true="1">' + value + '</li>';
            }
            quizArea.find('.question__select__choise').append(fuga);
        });
    }
    
    //結果表示
    // function quizResult(){
    //     quizArea.find('.question__main').hide();
    //     var text = quiz_fin_cnt + '問中' + quiz_success_cnt + '問正解！';
    // }
    
    //配列シャッフル
    function arrShuffle(arr){
        for(i = arr.length - 1; i > 0; i--){
            var j = Math.floor(Math.random() * (i + 1));
            var tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
        return arr;
    }
});