document.addEventListener('DOMContentLoaded', () => {
    const squares = document.querySelectorAll('.grid div')
    const scoreDisplay = document.querySelector('span')
    const startBtn = document.querySelector('.start')

    const width = 10
    let currentIndex = 0 //so first div in our grid
    let appleIndex = 0 //so first div in our grid
    let currentSnake = [2,1,0] 
    let direction = 1
    let score = 0
    let speed = 0.5
    let intervalTime = 0
    let interval = 0

//start and restart 
    function startGame(){
        currentSnake.forEach(index => squares[index].classList.remove('snake'))
        squares[appleIndex].classList.remove('apple')
        clearInterval(interval)
        score = 0
        randomApple()
        direction = 1
        scoreDisplay.innerText = score
        intervalTime = 1000
        currentSnake = [2,1,0]
        currentIndex = 0
        currentSnake.forEach(index => squares[index].classList.add('snake'))
        interval = setInterval(moveOutcomes, intervalTime)
    }

    //obijanie sie o ściany i żarcie jabłek
    function moveOutcomes(){
        if(
            (currentSnake[0] + width >= (width * width) && direction === width ) || //if snake hits bottom
            (currentSnake[0] % width === width -1 && direction === 1) || //if snake hits right wall
            (currentSnake[0] % width === 0 && direction === -1) || //if snake hits left wall
            (currentSnake[0] - width < 0 && direction === -width) ||  //if snake hits the top
            squares[currentSnake[0] + direction].classList.contains('snake') //if snake goes into itself
        ){
            return clearInterval(interval)
        }
        const tail = currentSnake.pop()
        squares[tail].classList.remove('snake')
        currentSnake.unshift(currentSnake[0] + direction)
        //jesli zeżre japko
        if( squares[currentSnake[0]].classList.contains('apple')) {
            squares[currentSnake[0]].classList.remove('apple')
            squares[tail].classList.add('snake')
            currentSnake.push(tail)
            randomApple()
            score++
            scoreDisplay.textContent = score
            clearInterval(interval)
            intervalTime = intervalTime * speed
            interval = setInterval(moveOutcomes, intervalTime)
          }
        squares[currentSnake[0]].classList.add('snake')
    }

    function randomApple(){
        do{
            appleIndex = Math.floor(Math.random() * squares.length)
        } while(squares[appleIndex].classList.contains('snake'))
        squares[appleIndex].classList.add('apple')
    }

    function control(e) {
        squares[currentIndex].classList.remove('snake')
        if(e.keyCode === 39) { //strzałka w prawo 
            direction = 1
        } else if (e.keyCode === 38) { //strzałka w góre
            direction = -width
        } else if( e.keyCode === 37) { //strzałka w lewo
            direction = -1
        } else if(e.keyCode === 40) { //strzałka w dół
            direction = +width
        }
    }

    document.addEventListener('keyup', control)
    startBtn.addEventListener('click', startGame)
})