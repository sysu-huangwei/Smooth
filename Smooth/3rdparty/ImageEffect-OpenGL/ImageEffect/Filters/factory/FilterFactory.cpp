//
//  FilterFactory.cpp
//
//  Created by rayyy on 2021/9/23.
//

#include "FilterFactory.hpp"

#include "BaseLog.h"

#include "BlurSubFilter.hpp"
#include "BlurFilter.hpp"
#include "BorderFilter.hpp"
#include "SmoothMixFilter.hpp"
#include "SmoothFilter.hpp"
#include "CorrectSizeFilter.hpp"

namespace effect {
    
std::shared_ptr<BaseFilter> FilterFactory::createFilter(const FilterDescription &filterDesc) {
    std::shared_ptr<BaseFilter> filter = nullptr;
    
    if (filterDesc.type == FilterType_BlurSub) {
        filter = std::make_shared<BlurSubFilter>();
    } else if (filterDesc.type == FilterType_Blur) {
        filter = std::make_shared<BlurFilter>();
    } else if (filterDesc.type == FilterType_Border) {
        filter = std::make_shared<BorderFilter>();
    } else if (filterDesc.type == FilterType_SmoothMix) {
        filter = std::make_shared<SmoothMixFilter>();
    } else if (filterDesc.type == FilterType_Smooth) {
        filter = std::make_shared<SmoothFilter>();
    } else if (filterDesc.type == FilterType_CorrectSize) {
        filter = std::make_shared<CorrectSizeFilter>();
    } else {
        LOGE("Error: FilterFactory::createFilter: invalid filter type = %s", filterDesc.type.c_str());
        assert(false);
    }
    
    filter->setEnableRender(filterDesc.enable);
    filter->setOutputSize(filterDesc.outputWidth, filterDesc.outputHeight);
    filter->setParams(filterDesc.params);
    
    return filter;
}

}
