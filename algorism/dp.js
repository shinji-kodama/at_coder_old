const lines = [[19,10],[19,19],[7,6],[7,3],[13,15]]
const w = 19

// ナップサック手続き
const dp = Array.from({length: w+1}, () => 0)
for (let i = 0; i < lines.length; i++) {
  const [a, b] = lines[i]
  for (let j = w; j >= 0; j--) {
    if (j + a <= w) {
      dp[j + a] = Math.max(dp[j + a], dp[j] + b)
    }
  }
}

// ナップサック手続き2
const dp1 = (lines,w) => {
  const tmp = Array.from({length: w+1}, () => 0)

  const dp = (tmp) => {
    return lines.map(([weight, value], i) => {
      tmp.forEach((v, j) => {
        if (j - weight >= 0) {
          tmp[j] = Math.max(tmp[j-weight] + value, v)
        }
      })
    })
    return tmp
  }
  return dp(tmp)[w]
}

// ナップサック再帰
const dp2 = (array, lines, i=0) => {
  // console.log(i, array)
	const _nextArray = () => array.map((v,j) => 
		j - lines[i][0] < 0 ? v : Math.max(v, array[j - lines[i][0]] + lines[i][1]))
	return i === lines.length ? array : dp2(_nextArray(), lines, i+1)
}

const array  = Array.from({length: w+1}, () => 0)

// console.log(dp2(array, lines)[w])

// 部分和問題
const nums = [1,2,4,7]
const k = 13

const dp3 = (nums, k) => {
  const tmp = Array.from({length: k+1}, () => false)
  tmp[0] = true
  nums.forEach((n) => {
    tmp.forEach((v, i) => {
      if (i - n >= 0) {
        tmp[i] = tmp[i] || tmp[i-n]
      }
    })
  })
  return tmp[k]
}

console.log(dp3(nums, k))
