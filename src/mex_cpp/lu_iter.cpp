#include "mex.hpp"
#include "mexAdapter.hpp"

using namespace matlab::data;
using matlab::mex::ArgumentList;

class MexFunction : public matlab::mex::Function {
public:
    void operator()(ArgumentList outputs, ArgumentList inputs) {
        // Validate arguments
        checkArguments(outputs, inputs);

        // Implement function
        getLU(inputs);
        // Assign outputs
        outputs[0]=inputs[0];
        outputs[1]=inputs[1];
    }

    void checkArguments(ArgumentList outputs, ArgumentList inputs) {
        std::shared_ptr<matlab::engine::MATLABEngine> matlabPtr = getEngine();
        ArrayFactory factory;
        if(inputs.size()!=3){
            matlabPtr->feval(u"error",
            0,std::vector<Array>({factory.createScalar("Two inputs required")}));
        }
        if(inputs[0].getType()!=ArrayType::DOUBLE||inputs[1].getType()!=ArrayType::DOUBLE){
            matlabPtr->feval(u"error",
            0,std::vector<Array>({factory.createScalar("input must be double array")}));
        }
        if (inputs[2].getNumberOfElements() != 1) {
            matlabPtr->feval(
                u"error", 0,
                std::vector<matlab::data::Array>({factory.createScalar(
                    "Input size must be a scalar")}));
        }

        if(outputs.size()!=2){
            matlabPtr->feval(u"error",
            0,std::vector<Array>({factory.createScalar("Two output is required")}));
        }
    }
    void getLU(ArgumentList input){
        TypedArray<double> L = std::move(input[0]);
        TypedArray<double> U = std::move(input[1]);
        int n = std::move(input[2][0]);
        for (size_t i = 0; i < n; i++)
        {
            L[i][i] = 1;
            for (size_t k = 0; k < i-1; k++)
            {
                U[i][i]-=L[i][k]*U[k][i];
            }
            for (size_t j = i+1; j < n; j++)
            {
                for (size_t k = 0; k < i-1; k++)
                {
                    U[i][j]-=L[i][k]*U[k][j];
                    L[j][i]-=L[j][k]*U[k][i];
                }
                L[j][i] /= U[i][i];                
            }            
        }
        
    }
};