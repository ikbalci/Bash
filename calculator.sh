factorial() {
    local num=$1
    local result=1

    for (( i=1; i<=num; i++ )); do
        result=$((result * i))
    done

    echo $result
}

calculate() {
    local operand=$1
    local num1=$2
    local num2=$3
    local result

    case $operand in
        +)
            result=$((num1 + num2))
            ;;
        -)
            result=$((num1 - num2))
            ;;
        \*)
            result=$((num1 * num2))
            ;;
        /)
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero"
                exit 1
            fi
            result=$((num1 / num2))
            ;;
        %)
            result=$((num1 % num2))
            ;;
        !)
            result=$(factorial "$num1")
            ;;
        *)
            echo "Error: Invalid operand"
            exit 1
            ;;
    esac

    echo $result
}

echo "Enter the calculation operand (+, -, *, /, %, !):"
read operand

if [ "$operand" == "!" ]; then
    echo "Enter the number:"
    read num1
    calculate $operand $num1
else
    echo "Enter the first number:"
    read num1
    echo "Enter the second number:"
    read num2
    calculate $operand $num1 $num2
fi
