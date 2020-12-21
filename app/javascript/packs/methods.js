const reductionStars = document.querySelector(".reduction-star").children;
const reductionCount = document.getElementById("reduction-count");
const reductionCountNumber = document.getElementById("reduction-count-number");
const continuationStars = document.querySelector(".continuation-star").children;
const continuationCount = document.getElementById("continuation-count");
const continuationCountNumber = document.getElementById("continuation-count-number");

let index;
const starClass = [
  {stars: reductionStars, count: reductionCount, countNumber: reductionCountNumber},
  {stars: continuationStars, count: continuationCount, countNumber: continuationCountNumber},
]

starClass.forEach( function( ary ){
  for(let i=0; i<ary.stars.length; i++){
    ary.stars[i].addEventListener("mouseover", function(){
      for(let j=0; j<ary.stars.length; j++){
        ary.stars[j].classList.remove("fa-star") // fa-star = 塗り潰しの星
        ary.stars[j].classList.add("fa-star-o") // fa-star-o = 外線のみの星
      }
      for(let j=0; j<=i; j++){
        ary.stars[j].classList.remove("fa-star-o")
        ary.stars[j].classList.add("fa-star")
      }
    })

    ary.stars[i].addEventListener("click", function(){
      ary.countNumber.value = i + 1;
      ary.count.textContent = ary.countNumber.value;
      index = i;
    })

    ary.stars[i].addEventListener("mouseout", function(){
      for(let j=0; j<ary.stars.length; j++){
        ary.stars[j].classList.remove("fa-star")
        ary.stars[j].classList.add("fa-star-o")
      }
      for(let j=0; j<=i; j++){
        ary.stars[j].classList.remove("fa-star-o")
        ary.stars[j].classList.add("fa-star")
      }
    })
  }
})