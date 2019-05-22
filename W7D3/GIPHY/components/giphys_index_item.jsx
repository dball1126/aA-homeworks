import React from 'react';

function GiphysIndexItem({giphy}) {
    return (
        <li className="giphy-li">
            <img src={giphy.images.fiex_height.url} />
        </li>
    );
}

export default GiphysIndexItem;