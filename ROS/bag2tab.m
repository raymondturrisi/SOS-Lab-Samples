%By Raymond Turrisi
%Converts basic data type into a neat table of arrays

   %bag2tab(bagFileName, topics to be rejected)
   %retrieve data as an array using {data = cell2mat(msgData(row,:).Data);
function msgData = bag2tab(str,rejects)
    
    %rejected topics, not message types
    
    %will be implementing try catch blocks for unknown message types that
    %throw and error
    rejects = [rejects,...
            "/rosout",...
            "/rosout_agg",...
            "/diagnostics",...
            "/diagnostics_agg",...
            "/diagnostics_toplevel_state"];
    rejects_map = containers.Map(rejects,ones(1,size(rejects,2)));
    %opens rosbag
    bag = rosbag(str);
    
    %gets list of topics
    topicList = string(bag.AvailableTopics.Properties.RowNames);
    messageTypes = string(bag.AvailableTopics.MessageType);
    
    %prealocates table
    msgData = table();
    
    %i is the index of the original topic list, k is the index of the
    %updating list which later becomes the names of the rows of the table
    k = 0;
    m = 0;
    %for size of length of topics
    for i = 1:1:size(topicList,1)
        k = k+1;
        m = m+1;
        %current topic name
        if(isKey(rejects_map,topicList(k)))
            topicList(k) = [];
            messageTypes(m) = [];
            k = k-1;
            m = m-1;
            continue 
        end

        %selects topic
        dat = select(bag,'Topic',topicList(k));
        %reads the messages
        msgs = readMessages(dat,'DataFormat','struct');

        %>>converts various message types for the MiniMAUV into cells
        if(messageTypes(m) == "sensor_msgs/Imu")
            %splits topic list to be expanded
            
            %splitting
            temp = topicList(k+1:end);
            %base topic which message contents gets appended to during
            %unpacking
            imu_topic_base = topicList(k);
            
            %deletes everything including and after the base topic
            topicList(k:end) = [];
            
            %adds topic base + data modifier
            topicList = [topicList;
                imu_topic_base+"_Orientation_x";...
                imu_topic_base+"_Orientation_y";...
                imu_topic_base+"_Orientation_z";...
                imu_topic_base+"_AngularVelocity_x";...
                imu_topic_base+"_AngularVelocity_y";...
                imu_topic_base+"_AngularVelocity_z";...
                imu_topic_base+"_LinearAcceleration_x";...
                imu_topic_base+"_LinearAcceleration_y";...
                imu_topic_base+"_LinearAcceleration_z";...
                temp];
            
            %extracts all the data from the message into a n by m matrix
            cdat = [
                cellfun(@(msgs) msgs.Orientation.X,msgs),...
                cellfun(@(msgs) msgs.Orientation.Y,msgs),...
                cellfun(@(msgs) msgs.Orientation.Z,msgs),...
                cellfun(@(msgs) msgs.AngularVelocity.X,msgs),...
                cellfun(@(msgs) msgs.AngularVelocity.Y,msgs),...
                cellfun(@(msgs) msgs.AngularVelocity.Z,msgs),....
                cellfun(@(msgs) msgs.LinearAcceleration.X,msgs),...
                cellfun(@(msgs) msgs.LinearAcceleration.Y,msgs),...
                cellfun(@(msgs) msgs.LinearAcceleration.Z,msgs)];
            
            %moves k (number expanded topics - 1) indices forward since one was deleted, then (number of modified topics) were
            %added
            k = k+8;
        elseif(messageTypes(m) == "sensor_msgs/MagneticField")
            temp = topicList((k+1):end);
            imu_topic_base = topicList(k);
            topicList(k:end) = [];
            topicList = [topicList;...
                imu_topic_base+"_MagneticField_x";...
                imu_topic_base+"_MagneticField_y";...
                imu_topic_base+"_MagneticField_z";...
                temp];
            cdat = [
                cellfun(@(msgs) msgs.MagneticField.X,msgs),...
                cellfun(@(msgs) msgs.MagneticField.Y,msgs),...
                cellfun(@(msgs) msgs.MagneticField.Z,msgs)];
                k = k+2;
                
        elseif(messageTypes(m) == "sensor_msgs/BatteryState")
            temp = topicList((k+1):end);
            imu_topic_base = topicList(k);
            topicList(k:end) = [];
            topicList = [topicList;...
                battery_topic_base+"_Voltage";...
                battery_topic_base+"_Current";...
                battery_topic_base+"_Charge";...
                temp];
            cdat = [
                cellfun(@(msgs) msgs.Voltage,msgs),...
                cellfun(@(msgs) msgs.Current,msgs),...
                cellfun(@(msgs) msgs.Charge,msgs)];
                k = k+2;
        elseif(messageTypes(m) == "geometry_msgs/Vector3")
            temp = topicList((k+1):end);
            imu_topic_base = topicList(k);
            topicList(k:end) = [];
            topicList = [topicList;...
                battery_topic_base+"_vector_x";...
                battery_topic_base+"_vector_y";...
                battery_topic_base+"_vector_z";...
                temp];
            cdat = [
                cellfun(@(msgs) msgs.X,msgs),...
                cellfun(@(msgs) msgs.Y,msgs),...
                cellfun(@(msgs) msgs.Z,msgs)];
                k = k+2;
        else
            cdat = cellfun(@(msgs) msgs.Data, msgs);

        end
        %stores compressed cell into table
        for t = 1:1:size(cdat,2)
            msgData = [msgData;num2cell(cdat(:,t),1)];
        end
    end
    %Gives row names to corresponding structs in the table
    for i = 1:1:size(topicList,1)
        topicList(i) = 'r'+string(i)+'_'+topicList(i);
    msgData.Properties.RowNames = topicList;
    msgData.Properties.VariableNames = {'Data'};
    msgData.Properties.Description = "Converted ROS bag into a table of structs. RowNames are the respective ROS topics.";
    msgData.Properties.DimensionNames = {'Topic'  'Variables'};
end